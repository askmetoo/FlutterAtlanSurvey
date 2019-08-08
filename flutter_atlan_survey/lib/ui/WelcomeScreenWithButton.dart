import 'package:flutter/material.dart';
import 'package:flutter_atlan_survey/modals/SurveyFormResponse.dart';

class WelCome extends StatefulWidget {
  final SurveyFormResponse surveyFormResponse;

  WelCome(this.surveyFormResponse);

  @override
  State<StatefulWidget> createState() => WelcomeState(surveyFormResponse);
}

class WelcomeState extends State<WelCome> {
  SurveyFormResponse surveyFormResponse;

  WelcomeState(this.surveyFormResponse);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
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
                    surveyFormResponse.welcomeScreens[0].title,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Text(
                      surveyFormResponse.welcomeScreens[0].properties.description,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible:
                      surveyFormResponse.welcomeScreens[0].properties.showButton,
                  child: ButtonTheme(
                    minWidth: 200,
                    child: FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Text(surveyFormResponse
                            .welcomeScreens[0].properties.buttonText)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
