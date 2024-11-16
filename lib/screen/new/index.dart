import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:toast_note/config/colors.dart';
import 'package:toast_note/provider/config.dart';
import 'package:toast_note/widget/custom_scaffold.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final QuillController _controller = QuillController.basic();
  late ConfigProvider configProvider;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);

    final themeBgColor = isThemeBgColor(configProvider);

    return CustomScaffold(
      title: '创建',
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: QuillEditor.basic(
                  controller: _controller,
                  configurations: const QuillEditorConfigurations(
                    placeholder: "请输入...",
                    textSelectionThemeData: TextSelectionThemeData(
                      cursorColor: commonDetultColor,
                    ),
                  ),
                ),
              ),
            ),
            QuillSimpleToolbar(
              controller: _controller,
              configurations: QuillSimpleToolbarConfigurations(
                multiRowsDisplay: false,
                color: themeBgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
