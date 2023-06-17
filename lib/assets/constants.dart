import 'package:flutter/material.dart';

//http://mcg.mbitson.com/ Creating a Color Palette For Flutter.

const MaterialColor kRedColor = MaterialColor(kRedPrimary, <int, Color>{
  50: Color(0xFFF6E0E0),
  100: Color(0xFFE8B3B3),
  200: Color(0xFFD98080),
  300: Color(0xFFC94D4D),
  400: Color(0xFFBE2626),
  500: Color(kRedPrimary),
  600: Color(0xFFAB0000),
  700: Color(0xFFA20000),
  800: Color(0xFF990000),
  900: Color(0xFF8A0000),
});
const int kRedPrimary = 0xFFB20000;

const MaterialColor kRedColorAccent = MaterialColor(kRedAccent, <int, Color>{
  100: Color(0xFFFFB6B6),
  200: Color(kRedAccent),
  400: Color(0xFFFF5050),
  700: Color(0xFFFF3636),
});
const int kRedAccent = 0xFFFF8383;
