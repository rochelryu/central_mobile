import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoadHide extends StatelessWidget {
  const LoadHide({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

Widget dialogCustomError(String title, String message, BuildContext context) {
  bool isIos = Platform.isIOS;
  return isIos
      ? CupertinoAlertDialog(
    title: Text(title),
    content: Text(message),
    actions: <Widget>[
      CupertinoDialogAction(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.of(context).pop();
          })
    ],
  )
      : AlertDialog(
    title: Text(title),
    content: Text(message),
    elevation: 20.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)),
    actions: <Widget>[
      TextButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.of(context).pop();
          })
    ],
  );
}
