import 'package:flutter/material.dart';

//http://mcg.mbitson.com/ Creating a Color Palette For Flutter.

MaterialColor colorpalette =
    const MaterialColor(_colorpalettePrimaryValue, <int, Color>{
  50: Color(0xFFFFEBEE),
  100: Color(0xFFFFCDD2),
  200: Color(0xFFEF9A9A),
  300: Color(0xFFE57373),
  400: Color(0xFFEF5350),
  500: Color(_colorpalettePrimaryValue),
  600: Color(0xFFE53935),
  700: Color(0xFFD32F2F),
  800: Color(0xFFC62828),
  900: Color(0xFFB71C1C),
});
const int _colorpalettePrimaryValue = 0xFFF44336;

const MaterialColor colorpaletteAccent =
    MaterialColor(_colorpaletteAccentValue, <int, Color>{
  100: Color(0xFFFF8A80),
  200: Color(_colorpaletteAccentValue),
  400: Color(0xFFFF1744),
  700: Color(0xFFD50000),
});
const int _colorpaletteAccentValue = 0xFFFF5252;
