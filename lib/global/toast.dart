
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void showToast({required String message,required int wtime,required Color bgcolor }){
  if (wtime>15 || wtime < 1) {
    wtime=2;
  }
  Fluttertoast.showToast(
    msg:message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: wtime,
    backgroundColor: bgcolor,
    textColor: Colors.white,
    fontSize: 16,
  );
}