import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_atlan_survey/bloc/form_bloc.dart';
import 'package:flutter_atlan_survey/modals/Field.dart';

import 'package:flutter_atlan_survey/modals/SurveyFromResponse.dart';
import 'package:flutter_atlan_survey/utils/CommonUtils.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SurveyFormScreen extends StatefulWidget {
  final SurveyResponse surveyFormResponse;

  SurveyFormScreen({this.surveyFormResponse});

  @override
  State<StatefulWidget> createState() => SurveyFormState(surveyFormResponse);
}

class SurveyFormState extends State<SurveyFormScreen> {
  final SurveyResponse surveyFormResponse;
  DateTime selectedDate = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  SurveyFormState(this.surveyFormResponse);

  List<DropdownMenuItem<Choices>> _dropdownMenuItems;
  Choices _selectedGender;

  FormBloc bloc;

  @override
  void initState() {
    _dropdownMenuItems =
        buildDropdownMenuItems(surveyFormResponse.fields[1].properties.choices);
    _selectedGender = surveyFormResponse.fields[1].properties.choices[0];

    bloc = new FormBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text(
            "Atlan Survey",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: new Container(
          color: Colors.white,
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
                              new BorderRadius.all(const Radius.circular(0.0)),
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: StreamBuilder<String>(
                          stream: bloc.name,
                          builder: (context, snapshot) {
                            return TextField(
                              obscureText: false,
                              textAlign: TextAlign.left,
                              onChanged: bloc.changeName,
                              decoration: InputDecoration(
                                errorText: snapshot.error,
                                border: InputBorder.none,
                                hintText: surveyFormResponse.fields[0].title,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          }),
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
                              new BorderRadius.all(const Radius.circular(0.0)),
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          StreamBuilder<String>(
                              stream: bloc.gender,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  );
                                } else {
                                  return Text(
                                    surveyFormResponse.fields[1].title,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  );
                                }
                              }),
                          DropdownButton(
                            isExpanded: false,
                            icon: Icon(Icons.arrow_drop_down_circle),
                            value: _selectedGender,
                            items: _dropdownMenuItems,
                            elevation: 0,
                            onChanged: onChangeDropdownItem,
                          ),
                        ],
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
                              new BorderRadius.all(const Radius.circular(0.0)),
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: StreamBuilder<String>(
                          stream: bloc.age,
                          builder: (context, snapshot) {
                            return TextField(
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              onChanged: bloc.changeAge,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                errorText: snapshot.error,
                                border: InputBorder.none,
                                hintText: surveyFormResponse.fields[2].title,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          }),
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
                              new BorderRadius.all(const Radius.circular(0.0)),
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: StreamBuilder<String>(
                          stream: bloc.email,
                          builder: (context, snapshot) {
                            return TextField(
                              obscureText: false,
                              onChanged: bloc.changeEmail,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                errorText: snapshot.error,
                                border: InputBorder.none,
                                hintText: surveyFormResponse.fields[3].title,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          }),
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
                              new BorderRadius.all(const Radius.circular(0.0)),
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: StreamBuilder<String>(
                          stream: bloc.phoneNumber,
                          builder: (context, snapshot) {
                            return TextField(
                              obscureText: false,
                              onChanged: bloc.changePhoneNumber,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorText: snapshot.error,
                                hintText: surveyFormResponse.fields[4].title,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.rectangle),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(surveyFormResponse.fields[5].title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          StreamBuilder<double>(
                              stream: bloc.rating,
                              initialData: 0.0,
                              builder: (context, snapshot) {
                                return SmoothStarRating(
                                    allowHalfRating: false,
                                    onRatingChanged: (v) {
                                      bloc.changeRating(v);
                                    },
                                    starCount: surveyFormResponse
                                        .fields[5].properties.steps,
                                    rating:
                                        snapshot.hasData ? snapshot.data : 0.0,
                                    size: 40.0,
                                    color: Colors.green,
                                    borderColor: Colors.green,
                                    spacing: 0.0);
                              })
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(0.0)),
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: StreamBuilder<String>(
                                  stream: bloc.date,
                                  initialData: surveyFormResponse
                                      .fields[6].title,
                                  builder: (context, snapshot) {
                                    return Text(
                                        snapshot.data,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.rectangle),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            surveyFormResponse.fields[7].title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(0.0)),
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0)),
                              child: StreamBuilder<bool>(
                                  stream: bloc.yesNo,
                                  initialData: true,
                                  builder: (context, snapshot) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              bloc.changeConsider(true);
                                            },
                                            child: Container(
                                              child: Center(
                                                  child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: snapshot.data
                                                        ? Colors.white
                                                        : Colors.black),
                                              )),
                                              color: snapshot.data
                                                  ? Colors.green
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              bloc.changeConsider(false);
                                            },
                                            child: Container(
                                              child: Center(
                                                  child: Text('No',
                                                      style: TextStyle(
                                                          color: !snapshot.data
                                                              ? Colors.white
                                                              : Colors.black))),
                                              color: !snapshot.data
                                                  ? Colors.red
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: ButtonTheme(
                        height: 40,
                        minWidth: 300,
                        child: StreamBuilder<bool>(
                            stream: bloc.submitValid,
                            initialData: false,
                            builder: (context, snapshot) {
                              return FlatButton(
                                onPressed: snapshot.hasData?
                                (snapshot.data ? () => bloc.submit(context,surveyFormResponse) : null):null,
                                disabledColor: Colors.grey,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.blue,
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  List<DropdownMenuItem<Choices>> buildDropdownMenuItems(
      List<Choices> choices) {
    print(choices.length);
    List<DropdownMenuItem<Choices>> items = List();
    for (Choices gender in choices) {
      items.add(
        DropdownMenuItem(
          value: gender,
          child: Text(gender.label),
        ),
      );
    }
    return items;
  }

  void onChangeDropdownItem(Choices value) {
    bloc.changeGender(value.label);
    setState(() {
      _selectedGender = value;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null){
      String date = new DateFormat.yMd().format(picked);
      bloc.changeDate(date);
    }
  }
}
