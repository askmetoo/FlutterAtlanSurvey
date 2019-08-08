import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_atlan_survey/api/RestApiCalls.dart';
import 'package:flutter_atlan_survey/modals/SurveyFormResponse.dart';
import 'package:flutter_atlan_survey/utils/AppConstants.dart';
import 'package:flutter_atlan_survey/utils/AppSharedPref.dart';
import 'package:flutter_atlan_survey/utils/CommonUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'WelcomeScreenWithButton.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Atlan Survey",style: TextStyle(color: Colors.blue),),
        ),
        body: FutureBuilder(
          future: getFormData(),
          builder: (buildContext, snapShot) {
            if (snapShot.hasData) {
              if (snapShot.data.toString() == "Error Occured") {
                return Container(
                  child: Text("Data is fetched failed"),
                );
              } else if (snapShot.data.toString() == "false"){
                return noInternetConnection();
              }else {
                SurveyFormResponse surveyFormResponse = SurveyFormResponse.fromJson(snapShot.data);
                SharedPrefHelper().save(AppConstants.IS_DATA_IN_DB, true);
                return WelCome(surveyFormResponse);
              }
            } else {
              // UI show when while data is fetching
              return _showProgressBarScreen();
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> getFormData() async {
    RestApiCalls apiCalls = new RestApiCalls();

    bool isNetworkConnected = await CommonUtils.isNetworkAvailable();
    print("isNetworkConnected"+isNetworkConnected.toString());

    if (isNetworkConnected) {
      // Internet is connected
      SurveyFormResponse surveyFormResponse =
          await apiCalls.getSurveyForm().catchError((Object error) {
        CommonUtils.showToast(msg: "Data fetch failed",bgColor: Colors.red);
      });

      if (surveyFormResponse == null){
        return "Error Occured";
      }

      return surveyFormResponse.toJson();
    } else {
      // Internet is disconnected
      print("disconnected");
      
      bool isData = await SharedPrefHelper().getWithDefault(AppConstants.IS_DATA_IN_DB, false);
      print("isData: "+isData.toString());
      if (isData){
        // Form Data is available in local db
        // Now Fetch data from local db
        return _fetchDataFromLocalDb();
      }else{
        // Form Data is not available (Please fetch data from api)
        return "false";
      }

    }
  }

  Widget _showProgressBarScreen() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Please Wait While Fetching Data",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  dynamic _fetchDataFromLocalDb() {
    return new SurveyFormResponse().toJson();
  }


  Widget noInternetConnection() {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              height: MediaQuery.of(context).size.height /
                  2, // Also Including Tab-bar height.
              child: Container(
                child: Image.asset("assets/internet_break.png"),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/curve_bg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "No Internet Connection ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "You are not connected to the internet Make Sure Wifi is on,\nAirplan mode is off and try again",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ButtonTheme(
                        height: 40,
                        minWidth: 120,
                        child: FlatButton(
                          onPressed: () {
                            CommonUtils.isNetworkAvailable().then((resp) async {
                              if (resp) {
                                setState(() {
                                  build(context);
                                });
                              } else {
                                CommonUtils.showToast(
                                    msg: "Internet is not connected",
                                    bgColor: Colors.blue);
                              }
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          color: Colors.white,
                          child: Text(
                            'Retry',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ) /* add child content here */,
              ),
            )
          ],
        ),
      ),
    );
  }

}
