import 'package:flutter/material.dart';

const primaryColor = Color(0xFF367FBF);
const whiteColor = Colors.white;
const greyWhiteColor = Colors.white54;
const greyColor = Colors.grey;
const sucessColor = Color(0xFF4BA395);
final errorColor = Colors.red[800];

TextStyle textTabsActif([double size = 13.0]) {
  return TextStyle(
      color: whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: size,
  );
}
TextStyle simpleTextWhite([double size = 13.0]) {
  return TextStyle(
    color: whiteColor,
    fontSize: size,
  );
}

TextStyle textTabsUnActif([double size = 13.0]) {
  return TextStyle(
      color: greyWhiteColor,
      fontSize: size,
  );
}
TextStyle simpleTextWithCustomSizeAndColors([double size = 13.0, Color color = greyColor]) {
  return TextStyle(
    color: color,
    fontSize: size,
  );
}

TextStyle textBoldWithColor([double size = 13.0, Color color = Colors.black]) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: size,
  );
}

TextStyle textBolderWithColor([double size = 13.0, Color color = Colors.black]) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: size,
  );
}