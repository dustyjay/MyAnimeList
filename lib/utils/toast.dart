import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static Future<bool?> displayToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.indigo,
        fontSize: 14.0,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }
}
