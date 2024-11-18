import 'package:flutter/cupertino.dart';
import 'package:toast_note/providers/config.dart';

const double iconSize = 20;

const Color commonColor = Color(0xFF266ED7);
const Color commonDetultColor = Color(0xFF4D8AEB);

const LinearGradient commonGradient = LinearGradient(
  colors: [
    commonColor,
    commonDetultColor,
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

Color isThemeBgColor(ConfigProvider configProvider) {
  if (configProvider.isLight) {
    return const Color(0xFFFFFFFF);
  } else {
    return const Color(0xFF0C0C0C);
  }
}

Color isThemePopupBgColor(ConfigProvider configProvider) {
  if (configProvider.isLight) {
    return const Color(0xFFFFFFFF);
  } else {
    return const Color(0xFF0E0E10);
  }
}
