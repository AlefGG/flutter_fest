import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';

abstract class AppTextStyle {
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 1.25,
    letterSpacing: 0.4,
    fontStyle: FontStyle.normal,
  );

  static const bookText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 1.25,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const bookTextSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 1.33,
    letterSpacing: 0.4,
    fontStyle: FontStyle.normal,
  );

  static const snackText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 1.33,
    letterSpacing: 0.4,
    fontStyle: FontStyle.normal,
  );

  static const timeText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 1.375,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const breakTimeElement = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 1.33,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const breakTimeElementSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.steinbeck,
    height: 1.66,
    letterSpacing: 2.6,
    fontStyle: FontStyle.normal,
  );

  static const speakerName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 1.16666667,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const bookTextItalic = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 1.428,
    letterSpacing: 0.0,
    fontStyle: FontStyle.italic,
  );

  static const steinbeckNormalText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.steinbeck,
    height: 22 / 18,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const steinbeckText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.steinbeck,
    height: 28 / 24,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const steinbeckHeadItalic = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.steinbeck,
    height: 40 / 36,
    letterSpacing: 0.0,
    fontStyle: FontStyle.italic,
  );

  static const steinbeckHeadNormal = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.steinbeck,
    height: 40 / 36,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const dialogTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 22 / 17,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const dialogCancelAction = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 22 / 17,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );

  static const dialogAction = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.basisGrotesquePro,
    height: 22 / 17,
    letterSpacing: 0.0,
    fontStyle: FontStyle.normal,
  );
}
