import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppColors {
  AppColors._();

  static const Color golden= Color(0xffCAAC59);
  static const Color Danger= Color(0xffFF6262);
  static const Color goldenlight= Color(0xffDBC483);
  static const Color primaryGreen = Color(0xffCAAC59);
  static const Color primaryGreen2 = Color(0xff1c8c8a);
  static const Color textGreen = Color(0xFFffFF6262);
  static const Color grey = Color(0xFFE5E5E5);
  static const Color Tick = Color(0xFFC4C4C4);
  static const Color card = Color(0xFFF3F3F3);
  static const Color greylight = Color(0xFFF8F8F8);
  static const Color mark =  Color.fromRGBO (	171, 171, 171, 1.0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGrey = Color(0xFF7A7575);
  static const Color black= Color(0xFF050505);
  static const Color lightblack= Color(0xFF333333);
  static const Color background= Color(0xFFEBEBEB);
  static const Color yellow= Color(0xFFF2B200);
  static const Color green= Color(0xFF6CBB1D);
  static const Color blue= Color(0xFF1B8989);
  static const Color greydark= Color(0xFFABABAB);
  static const Color cardLight = Color(0xFFFFFFFF);
}

abstract class AppTheme {
  AppTheme._();
  static ThemeData light() {
    const appBarIconTheme = IconThemeData(
      color: AppColors.darkGrey,
    );
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        displayColor: AppColors.black,
        bodyColor: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primaryGreen,
      //text
      colorScheme:const ColorScheme.light(
        primary: AppColors.primaryGreen,
        secondary: AppColors.black,
      ),
      buttonTheme: const ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3.0),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: AppColors.white,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          color: AppColors.darkGrey,
        ),
        iconTheme: appBarIconTheme,
        actionsIconTheme: appBarIconTheme,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      //card
      cardTheme: CardTheme(
        shadowColor: AppColors.black.withOpacity(0.3),
        color: AppColors.cardLight,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3.0),
          ),
        ),
      ),
    );
  }

  // TODO : custom dark theme method
  static ThemeData dark() {
    const appBarIconTheme = IconThemeData(
      color: AppColors.white,
    );
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        displayColor: AppColors.black,
        bodyColor: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primaryGreen,
      //text
      colorScheme:const ColorScheme.light(
        primary: AppColors.primaryGreen,
        secondary: AppColors.black,
      ),
      buttonTheme: const ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3.0),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: AppColors.white,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          color: AppColors.darkGrey,
        ),
        iconTheme: appBarIconTheme,
        actionsIconTheme: appBarIconTheme,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      //card
      cardTheme: CardTheme(
        shadowColor: AppColors.black.withOpacity(0.3),
        color: AppColors.cardLight,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3.0),
          ),
        ),
      ),
    );
  }
}