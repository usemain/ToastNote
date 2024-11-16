import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:toast_note/config/colors.dart';
import 'package:toast_note/provider/config.dart';
import 'package:provider/provider.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final QuillController _controller = QuillController.basic();
  late ConfigProvider configProvider;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    configProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);

    final themeBgColor = isThemeBgColor(configProvider);

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 15,
            ),
            child: QuillEditor.basic(
              controller: _controller,
              configurations: QuillEditorConfigurations(
                textSelectionThemeData: TextSelectionThemeData(
                  cursorColor:
                      configProvider.isLight ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
        QuillSimpleToolbar(
          controller: _controller,
          configurations: QuillSimpleToolbarConfigurations(
            multiRowsDisplay: false,
            color: themeBgColor, // Ensure this is a valid color
          ),
        ),
      ],
    );
  }
}
