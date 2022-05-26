import 'package:core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kPrimaryColor,
      primaryContainer: kPrimaryLight,
      onPrimary: kPrimaryText,
      secondary: kSecondaryColor,
      secondaryContainer: kSecondaryLight,
      onSecondary: kSecondaryText,
      error: kErrorRed,
    ),
    dialogTheme: DialogTheme(
        backgroundColor: kSecondaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
    cardTheme: CardTheme(
        color: kSecondaryDark,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    ),
    dataTableTheme: DataTableThemeData(
      // dataRowColor: MaterialStateProperty.all(kSecondaryLight),
      dataTextStyle: base.textTheme.subtitle1!.copyWith(color: kPrimaryText),
      headingRowColor: MaterialStateProperty.all(kSecondaryColor),
    ),
    snackBarTheme: const SnackBarThemeData(
      elevation: 7.0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    ),
    textTheme: _buildAppTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kSecondaryColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalElevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: kSecondaryLight,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        borderSide: BorderSide(
          width: 2.0,
          color: kSecondaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    ),
  );
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: GoogleFonts.firaSans().fontFamily,
        displayColor: kPrimaryText,
        bodyColor: kSecondaryText,
      );
}
