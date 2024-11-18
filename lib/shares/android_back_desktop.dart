import 'package:flutter/services.dart';
import 'package:toast_note/shares/native.dart';

class AndroidBack {
  static MethodChannel platform = const MethodChannel(androidBack);

  static Future<void> backDeskTop() async {
    try {
      await platform.invokeMethod('backDesktop');
    } on PlatformException {
      SystemNavigator.pop();
    }
  }
}
