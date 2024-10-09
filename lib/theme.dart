import 'package:flutter/material.dart';

final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue.shade100,
  brightness: Brightness.light,
);

ThemeData masterTheme = ThemeData(
  colorScheme: _lightColorScheme,
  appBarTheme: AppBarTheme(
    elevation: 2.0,
    shadowColor: _lightColorScheme.inversePrimary,
    foregroundColor: _lightColorScheme.onPrimary,
    backgroundColor: _lightColorScheme.primary,
    titleTextStyle: const TextStyle().copyWith(
      color: _lightColorScheme.onPrimary,
      fontVariations: const [FontVariation("wght", 500)],
      fontFamily: "Montserrat",
      fontSize: 20.0,
    ),
  ),
  dialogTheme: DialogTheme(
    elevation: 5,
    titleTextStyle: TextStyle(
      color: _lightColorScheme.inverseSurface,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      color: _lightColorScheme.onSurface,
      fontSize: 16.0,
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 4.0,
    foregroundColor: _lightColorScheme.onInverseSurface,
    backgroundColor: _lightColorScheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: _lightColorScheme.onInverseSurface,
      backgroundColor: _lightColorScheme.primary,
    ),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: const TextStyle().copyWith(
      color: _lightColorScheme.onPrimaryContainer,
      fontSize: 16.0,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
      ),
    ),
  ),
);
