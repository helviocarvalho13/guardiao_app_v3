import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
  );
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w400
  );
  static final commonTextStyle2 = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w400
  );
  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
  );
  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w400
  );
}