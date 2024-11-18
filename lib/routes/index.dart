import 'package:flutter/material.dart';
import 'package:toast_note/screens/Data/index.dart';
import 'package:toast_note/screens/Layout/index.dart';
import 'package:toast_note/screens/NoteEditor/index.dart';
import 'package:toast_note/screens/Settings/index.dart';
import 'package:toast_note/screens/User/index.dart';

Route<dynamic> routes(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case '/':
      builder = (BuildContext _) => const LayoutPage();
      break;
    case '/NoteEditor':
      builder = (BuildContext _) => const NoteEditorPage();
      break;
    case '/User':
      builder = (BuildContext _) => const UserPage();
      break;
    case '/Data':
      builder = (BuildContext _) => const DataPage();
      break;
    case '/Settings':
      builder = (BuildContext _) => const SettingsPage();
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    settings: settings,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      var opacityTween = Tween(begin: 0.0, end: 1.0);
      var opacityAnimation = animation.drive(opacityTween);

      return FadeTransition(
        opacity: opacityAnimation,
        child: SlideTransition(
          position: offsetAnimation,
          child: child,
        ),
      );
    },
  );
}
