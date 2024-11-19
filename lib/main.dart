import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/translations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast_note/shares/colors.dart';
import 'package:toast_note/providers/config.dart';
import 'package:toast_note/routes/index.dart';
import 'package:toast_note/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConfigProvider configProvider = ConfigProvider();
  await init(configProvider);
  runApp(MainPage(configProvider: configProvider));
}

Future<void> init(ConfigProvider configProvider) async {
  String? theme = (await SharedPreferences.getInstance()).getString("Theme");
  configProvider.setTheme(theme ?? 'Light');
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.configProvider});

  final ConfigProvider configProvider;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.configProvider,
      child: Consumer<ConfigProvider>(
        builder: (context, configProvider, child) {
          return MaterialApp(
            title: 'ProjectManage',
            theme: initTheme(configProvider),
            locale: const Locale('zh', 'CH'),
            supportedLocales: const [
              Locale('zh', 'CH'),
              Locale('en', 'US'),
            ],
            localizationsDelegates: const [
              FlutterQuillLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            initialRoute: '/',
            onGenerateRoute: routes,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
