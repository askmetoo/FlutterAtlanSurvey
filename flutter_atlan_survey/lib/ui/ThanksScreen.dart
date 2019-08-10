import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_atlan_survey/modals/SurveyFromResponse.dart';

import 'SurveyFormScreen.dart';

class Thanks extends StatefulWidget{

  final SurveyResponse response;



  Thanks({Key key, this.response}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ThanksState(response);
}

class ThanksState extends State<Thanks>{

  final SurveyResponse response;
  StreamController<String> _streamController = new StreamController.broadcast();

  ThanksState(this.response);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: true,
      child: StreamBuilder<String>(
        initialData: "NextPage",
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.data == "NextPage"){
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text("Atlan Survey",style: TextStyle(color: Colors.blue),),
              ),
              body: Container(
                child: SecondThanksPage(response),
              ),
            );
          }else{
            return Scaffold(
              body: Container(
                child: FirstThanksPage(response),
              ),
            );
          }


        }
      ),
    );
  }

  Widget SecondThanksPage(SurveyResponse response) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  response.thankyouScreens[0].title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Visibility(
                    visible: response
                        .thankyouScreens[0].properties.showButton,
                    child: ButtonTheme(
                      minWidth: 100,
                      child: FlatButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => SurveyFormScreen(
                                    surveyFormResponse: response)));
                          },
                          child: Text(response
                              .thankyouScreens[0].properties.buttonText.toUpperCase())),
                    )),
                Visibility(
                    visible: response
                        .thankyouScreens[0].properties.shareIcons,
                    child: ButtonTheme(
                      minWidth: 100,
                      child: IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {

                          }),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget FirstThanksPage(SurveyResponse response) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  response.thankyouScreens[1].title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),

                Image.network(response.thankyouScreens[1].attachment.href)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Visibility(
                    visible: response
                        .thankyouScreens[1].properties.showButton,
                    child: ButtonTheme(
                      minWidth: 100,
                      child: FlatButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            /*Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => SurveyFormScreen(
                                    surveyFormResponse: response)));*/

                            _streamController.sink.add("NextPage");
                          },
                          child: Text(response
                              .thankyouScreens[1].properties.buttonText.toUpperCase())),
                    )),
                Visibility(
                    visible: response
                        .thankyouScreens[1].properties.shareIcons,
                    child: ButtonTheme(
                      minWidth: 100,
                      child: IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {

                          }),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
  
}