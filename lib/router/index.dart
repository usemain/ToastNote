import 'package:flutter/material.dart';
import 'package:toast_note/screen/data/index.dart';
import 'package:toast_note/screen/layout/index.dart';
import 'package:toast_note/screen/settings/index.dart';
import 'package:toast_note/screen/user/index.dart';

Route<dynamic> routes(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case '/':
      builder = (BuildContext _) => const LayoutPage();
      break;
    case '/user':
      builder = (BuildContext _) => const UserPage();
      break;
    case '/data':
      builder = (BuildContext _) => const DataPage();
      break;
    case '/settings':
      builder = (BuildContext _) => const SettingsPage();
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    settings: settings,
    transitionsBuilder: (context, animation, _, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
