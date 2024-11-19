import 'package:flutter/material.dart';
import 'package:toast_note/providers/config.dart';
import 'package:toast_note/shares/colors.dart';

ThemeData initTheme(ConfigProvider configProvider) {
  ThemeData isTheme =
      configProvider.isLight ? ThemeData.light() : ThemeData.dark();
  Color isBackground = isThemeBgColor(configProvider);
  Color isPopupBg = isThemePopupBgColor(configProvider);
  Color isPrimary = configProvider.isLight ? Colors.black : Colors.white;

  return isTheme.copyWith(
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    shadowColor: Colors.transparent,
    hintColor: Colors.transparent,
    disabledColor: Colors.transparent,
    cardColor: Colors.transparent,
    primaryColor: commonColor,
    canvasColor: isBackground,
    dialogBackgroundColor: isBackground,
    scaffoldBackgroundColor: isBackground,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: configProvider.isLight
            ? const Color.fromARGB(255, 166, 166, 166)
            : const Color.fromARGB(255, 99, 99, 99),
      ),
    ),
    colorScheme: (configProvider.isLight
            ? const ColorScheme.light()
            : const ColorScheme.dark())
        .copyWith(
      primary: commonColor,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          Colors.transparent,
        ),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: isPopupBg,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: isPopupBg,
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 55,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: isBackground,
      titleTextStyle: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: isPrimary,
      ),
      iconTheme: IconThemeData(
        size: 20,
        color: isPrimary,
        shadows: const [
          Shadow(
            color: Colors.transparent,
            blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
    ),
  );
}
