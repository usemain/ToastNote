import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toast_note/screens/NoteEditor/note_editor_menu.dart';
import 'package:toast_note/shares/colors.dart';
import 'package:toast_note/providers/config.dart';
import 'package:toast_note/shares/config.dart';
import 'package:toast_note/widgets/custom_scaffold.dart';

class NoteEditorPage extends StatefulWidget {
  const NoteEditorPage({super.key});

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  final QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  late ConfigProvider configProvider;

  @override
  void initState() {
    _controller.document = Document.fromJson(docData);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);

    Color themeBgColor = isThemeBgColor(configProvider);

    return PopScope(
      canPop: false,
      child: CustomScaffold(
        title: '编辑',
        // interceptBack: true,
        interceptMessage: '您确定退出编辑吗?',
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: commonColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () {
                final json =
                    jsonEncode(_controller.document.toDelta().toJson());
                debugPrint(json);
              },
              child: const Icon(
                FontAwesomeIcons.check,
                size: 14,
                color: Colors.white,
              ),
            ),
          )
        ],
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
                    focusNode: _focusNode,
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
              // 字号 标题
              NoteEditorMenu(editorController: _controller)
            ],
          ),
        ),
      ),
    );
  }
}
