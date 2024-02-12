import 'package:flow/src/themes/themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData defaultTheme(Brightness brightness) => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Pallete.seedColor,
          brightness: brightness,
        ),
      ).copyWith(
        appBarTheme: const AppBarTheme().copyWith(
          centerTitle: true,
        ),
      );
}
