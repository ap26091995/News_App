import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Global {
  static int currentPageIndex = 0;
  static double iconSize = 0.07;
}


Show_toast_Now(String msg,Color color){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb	: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}