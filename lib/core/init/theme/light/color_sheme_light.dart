import 'package:flutter/material.dart';

class ColorShemeLight {
  static ColorShemeLight? _instance;
  static ColorShemeLight get instance {
    _instance ??= ColorShemeLight._init();
    return _instance!;
  }

  ColorShemeLight._init();

  final Color brown = Color(0xffa87e6f);
  final Color red = Color(0xffc10e0e);
  final Color white = Color(0xffffffff);
  final Color gray = Color(0xffE5E5E5);
  final Color lightGray = Color(0xfff7f7f7);
  final Color darkGray = Color(0xff676870);
  final Color black = Color(0xff020306);
  final Color azure = Color(0xff27928d);
  final Color pink = Color(0xffCC2B5E);

  final Color borderColor = Color(0xffBABABA);
}
