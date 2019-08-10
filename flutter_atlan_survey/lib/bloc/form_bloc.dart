import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_atlan_survey/db/FormDatabaseRepository.dart';
import 'package:flutter_atlan_survey/modals/FormData.dart';
import 'package:flutter_atlan_survey/modals/SurveyFromResponse.dart';
import 'package:flutter_atlan_survey/ui/ThanksScreen.dart';
import 'package:flutter_atlan_survey/utils/CommonUtils.dart';
import 'package:rxdart/rxdart.dart';

class FormBloc extends Object with BaseBloc, Validator {
  final _email = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _gender = BehaviorSubject<String>();
  final _age = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _rating = BehaviorSubject<double>();
  final _date = BehaviorSubject<String>();
  final _YesNo = BehaviorSubject<bool>();

  // retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<bool> get yesNo => _YesNo.stream;

  Stream<String> get name => _name.stream.transform(validateEmpty);

  Stream<String> get age => _age.stream.transform(validateEmpty);

  Stream<String> get gender => _gender.stream.transform(validateEmpty);

  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumber);

  Stream<double> get rating => _rating.stream.transform(validateRating);

  Stream<String> get date => _date.stream.transform(validateEmpty);

  Stream<bool> get submitValid => Observable.combineLatest6(
      email, name, age, gender, rating, date, (e, n, a, g, r, d) => true);

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changeName => _name.sink.add;

  Function(String) get changeAge => _age.sink.add;

  Function(String) get changePhoneNumber => _phoneNumber.sink.add;

  Function(String) get changeGender => _gender.sink.add;

  Function(String) get changeDate => _date.sink.add;

  Function(double) get changeRating => _rating.sink.add;

  Function(bool) get changeConsider => _YesNo.sink.add;

  submit(BuildContext context, SurveyResponse response) async {
    FormData data = new FormData(
        email: _email.value,
        name: _name.value,
        age: _age.value,
        gender: _gender.value,
        phoneNumber: _phoneNumber.value,
        rating: _rating.value.toString(),
        date: _date.value,
        YesNo: _YesNo.value.toString());

    FormDatabaseRepository repository = new FormDatabaseRepository();
    FormData _data = await repository.insert(data);

    print(_data.toMap().toString());

    CommonUtils.showToast(
        msg: "Your response is submit successfully", bgColor: Colors.blue);

    dispose();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Thanks(response: response)));
  }

  @override
  void dispose() {
    _email.close();
    _name.close();
    _gender.close();
    _age.close();
    _phoneNumber.close();
    _rating.close();
    _date.close();
    _YesNo.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
