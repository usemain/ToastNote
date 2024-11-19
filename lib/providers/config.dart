import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigProvider extends ChangeNotifier {
  late bool _isLight;
  bool get isLight => _isLight;

  void setTheme(String theme) async {
    _isLight = (theme == 'Light');
    (await SharedPreferences.getInstance()).setString("Theme", theme);
    notifyListeners();
  }
}
