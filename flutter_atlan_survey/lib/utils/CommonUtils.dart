import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtils {
  static Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //  print('connected');
        return true;
      }
    } on SocketException catch (_) {
      //print('not connected');
      return false;
    }
  }

  static void showToast({Key key, String msg, Color bgColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 13.0);
  }
}

class Validator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(email))
      sink.add(email);
    else
      sink.addError('Enter a valid email');
  });

  final validateEmpty =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value != "")
      sink.add(value);
    else
      sink.addError('Please fill the field');
  });

  final validatePhoneNumber =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length > 8 && value.length < 12)
      sink.add(value);
    else if (value.isEmpty) sink.addError('Please Enter valid phone number');
  });

  final validateRating =
      StreamTransformer<double, double>.fromHandlers(handleData: (value, sink) {
    if (value != 0.0)
      sink.add(value);
    else {
      sink.addError('Please give Rating');
    }
  });
}
