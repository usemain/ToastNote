import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigProvider extends ChangeNotifier {
  late String _theme;

  String get theme => _theme;

  late bool _isLight;

  bool get isLight => _isLight;

  void toggleTheme() {
    _isLight = !_isLight;
    _theme = _isLight ? 'Light' : 'Dark';
    notifyListeners();
  }

  void setTheme(String theme) async {
    _theme = theme;
    _isLight = (theme == 'Light');
    (await SharedPreferences.getInstance()).setString("Theme", theme);
    notifyListeners();
  }
}
