import 'package:flutter/material.dart';
import 'package:flutter_atlan_survey/modals/SurveyFormResponse.dart';

class SurveyFormScreen extends StatefulWidget {
  final SurveyFormResponse surveyFormResponse;

  SurveyFormScreen({this.surveyFormResponse});

  @override
  State<StatefulWidget> createState() => SurveyFormState(surveyFormResponse);
}

class SurveyFormState extends State<SurveyFormScreen> {
  final SurveyFormResponse surveyFormResponse;

  SurveyFormState(this.surveyFormResponse);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
