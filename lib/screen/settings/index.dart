import 'package:flutter/material.dart';
import 'package:toast_note/config/colors.dart';
import 'package:toast_note/provider/config.dart';
import 'package:toast_note/widget/custom_scaffold.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);

    return CustomScaffold(
      title: "设置",
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ThemeBox(
                    title: '浅色',
                    isLight: configProvider.isLight,
                    onTap: () {
                      configProvider.setTheme('Light');
                    },
                  ),
                ),
                Expanded(
                  child: ThemeBox(
                    title: '黑暗',
                    isLight: !configProvider.isLight,
                    onTap: () {
                      configProvider.setTheme('Dark');
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ThemeBox extends StatelessWidget {
  const ThemeBox(
      {super.key,
      required this.title,
      required this.isLight,
      required this.onTap});

  final String title;
  final bool isLight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color textColor = isLight
        ? commonColor
        : (Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black);
    Color iconColor = isLight
        ? commonColor
        : (Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black);

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: 25,
            ),
            child: Center(
              child: Column(
                children: [
                  Visibility(
                    visible: title == '浅色',
                    child: const ThemeBgBox(
                      borderColor: Color.fromARGB(255, 239, 239, 239),
                      bgColor: Colors.white,
                      lineColor: Color.fromARGB(255, 232, 232, 232),
                    ),
                  ),
                  Visibility(
                    visible: title == '黑暗',
                    child: const ThemeBgBox(
                      borderColor: Color.fromARGB(255, 57, 57, 57),
                      bgColor: Color.fromARGB(255, 33, 33, 33),
                      lineColor: Color.fromARGB(255, 114, 114, 114),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Icon(
                    isLight
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: iconColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ThemeBgBox extends StatelessWidget {
  const ThemeBgBox({
    super.key,
    required this.borderColor,
    required this.bgColor,
    required this.lineColor,
  });

  final Color borderColor;
  final Color bgColor;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: lineColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                color: lineColor,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
