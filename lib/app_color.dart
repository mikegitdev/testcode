import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static const Color redAccent = Colors.redAccent;
  static const Color transparent = Colors.transparent;

  static const Color cF3F8FF = Color(0xFFF3F8FF);
  static const Color cDCEAFF = Color(0xFFDCEAFF);
  static const Color cC4DCFF = Color(0xFFC4DCFF);
  static const Color cACCEFF = Color(0xFFACCEFF);
  static const Color c95BFFF = Color(0xFF95BFFF);
  static const Color c66A3FF = Color(0xFF66A3FF);
  static const Color c4E95FF = Color(0xFF4E95FF);
  static const Color c3687FF = Color(0xFF3687FF);
  static const Color c1F79FF = Color(0xFF1F79FF);
  static const Color c1372FF = Color(0xFF1372FF);
  static const Color c0F5BCC = Color(0xFF0F5BCC);
  static const Color c0B4499 = Color(0xFF0B4499);
  static const Color c082E66 = Color(0xFF082E66);
  static const Color c041733 = Color(0xFF041733);

  static const Color cFFF9F9 = Color(0xFFFFF9F9);
  static const Color cACB1CE = Color(0xFFACB1CE);
  static const Color c9A9EBA = Color(0xFF9A9EBA);
  static const Color c878CA5 = Color(0xFF878CA5);
  static const Color c757991 = Color(0xFF757991);
  static const Color c62677D = Color(0xFF62677D);
  static const Color c4F5569 = Color(0xFF4F5569);
  static const Color c3D4255 = Color(0xFF3D4255);
  static const Color c2A3040 = Color(0xFF2A3040);
  static const Color c181D2C = Color(0xFF181D2C);
  static const Color c050B18 = Color(0xFF050B18);
  static const Color c15213B = Color(0xFF15213B);
  static const Color c83C3F5 = Color(0xFF83C3F5);
  static const Color cDCDEE2 = Color(0xFFDCDEE2);
  static const Color cE50101 = Color(0xFFE50101);
  static const Color c969BA7 = Color(0xFF969BA7);
  static const Color cF30101 = Color(0xFFF30101);
  static const Color cAD0101 = Color(0xFFAD0101);
  static const Color c626262 = Color(0xFF626262);
  static const Color c676F80 = Color(0xFF676F80);
  static const Color c56CCF2 = Color(0xFF56CCF2);
  static const Color c2F80ED = Color(0xFF2F80ED);
  static const Color cF9F9F9 = Color(0xFFF9F9F9);
  static const Color cE2F1FD = Color(0xFFE2F1FD);
  static const Color cF5F5F5 = Color(0xFFF5F5F5);
  static const Color c00AE26 = Color(0xFF00AE26);
  static const Color cF6FAFE = Color(0xFFF6FAFE);
  static const Color c969696 = Color(0xFF969696);
  static const Color cCFE8FB = Color(0xFFCFE8FB);
  static const Color c41A3F0 = Color(0xFF41A3F0);
  static const Color cE5E5E5 = Color(0xFFE5E5E5);

  static const LinearGradient gradient_01 = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [cF30101, cAD0101],
    stops: [0.0, 1.0],
  );

  static const LinearGradient gradient_02 = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [cF30101, cAD0101],
    stops: [0.0, 1.0],
  );

  static const LinearGradient gradient_03 = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [c56CCF2, c2F80ED],
    stops: [0.0, 1.0],
  );

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }
}
