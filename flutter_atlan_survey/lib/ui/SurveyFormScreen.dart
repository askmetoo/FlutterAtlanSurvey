import 'package:flutter/material.dart';
import 'package:flutter_atlan_survey/modals/SurveyFormResponse.dart';
import 'package:flutter_atlan_survey/utils/CommonUtils.dart';

class SurveyFormScreen extends StatefulWidget {
  final SurveyFormResponse surveyFormResponse;

  SurveyFormScreen({this.surveyFormResponse});

  @override
  State<StatefulWidget> createState() => SurveyFormState(surveyFormResponse);
}

class SurveyFormState extends State<SurveyFormScreen> {
  final SurveyFormResponse surveyFormResponse;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  var _gender;

  List<String> _genderList;
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedGender;

  SurveyFormState(this.surveyFormResponse);

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_genderList);
    _selectedGender = _dropdownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _gender = surveyFormResponse.fields[1].title;
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Atlan Survey",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: new Container(
          child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 20.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(15.0)),
                          border: Border.all(color: Colors.black, width: 1.0)),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: TextField(
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: surveyFormResponse.fields[0].title,
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Catamaran",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(15.0)),
                          border: Border.all(color: Colors.black, width: 1.0)),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '$_gender',
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                          DropdownButton(
                            icon: Icon(Icons.arrow_drop_down_circle),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  bool _validateInput() {
    if (_formKey.currentState.validate()) {
      // If all data are correct then save data to out variables
      _formKey.currentState.save();
      return true;
    } else {
      // If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
      return false;
    }
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List<String> genderList) {
    List<DropdownMenuItem<String>> items = List();
    for (String gender in genderList) {
      items.add(
        DropdownMenuItem(
          value: gender,
          child: Text(gender),
        ),
      );
    }
    return items;
  }
}
