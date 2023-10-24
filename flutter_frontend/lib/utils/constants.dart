import 'package:flutter/material.dart';

class ColorConstants {
  static const Color appBarColor = Color(0xFF3E3E3E);
  static const Color backgroundColor = Color(0xFFF2F2F7);
  static const Color pandaGreen = Color(0xFFD0F0C0);
  static const Color pandaBlack = Color(0xFF3E3E3E);
  static const Color accentColor = Color(0xFF396122);
  static const Color settingsListBackground = Color(0xFFF2F2F7);
  static const Color settingsSectionBackground = Colors.white;
  static const Color yellow = Colors.yellow;
  static const Color lightBlue = Colors.lightBlue;
  static const Color blue = Colors.blue;
  static const Color grey = Colors.grey;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
}

final elevatedButtonStyle = ElevatedButton.styleFrom(
  fixedSize: const Size.fromWidth(200.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  ),
  foregroundColor: Colors.white,
  backgroundColor: ColorConstants.accentColor,
);

ThemeData pandaTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: Color(0xFF222222),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25.0,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: ColorConstants.accentColor,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  primaryColor: const Color(0xFF222222),
  hintColor: const Color(0xFF396122),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Color(0xFF222222),
    ),
  ),
);

const kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);

const kButtonTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kHintTextStyle = TextStyle(
  fontSize: 16.0,
  color: Color(0xFF3E3E3E),
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF3E3E3E),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

final kTextButtonStyle = TextButton.styleFrom(
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  splashFactory: NoSplash.splashFactory,
);

final kElevatedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[100]!),
);