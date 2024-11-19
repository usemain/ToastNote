import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteEditorMenu extends StatefulWidget {
  const NoteEditorMenu({super.key, required this.editorController});
  final QuillController editorController;

  @override
  State<NoteEditorMenu> createState() => _NoteEditorMenuState();
}

class _NoteEditorMenuState extends State<NoteEditorMenu> {
  late QuillController editorController;

  bool invoke(String command) {
    return widget.editorController
            .getSelectionStyle()
            .attributes[command]
            ?.value ??
        false;
  }

  // 撤销
  void leftLong() {
    widget.editorController.undo();
  }

  // 回撤
  void rightLong() {
    widget.editorController.redo();
  }

  // 背景颜色
  void backgroundColor() {}

  // 加粗
  void bold() {
    if (invoke('bold')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.bold, null));
    } else {
      widget.editorController.formatSelection(Attribute.bold);
    }
  }

  // 斜体
  void italic() {
    if (invoke('italic')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.italic, null));
    } else {
      widget.editorController.formatSelection(Attribute.italic);
    }
  }

  // 下划线
  void underline() {
    if (invoke('underline')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.underline, null));
    } else {
      widget.editorController.formatSelection(Attribute.underline);
    }
  }

  // 删除线 ******
  void strikethrough() {
    if (invoke('strikeThrough')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.strikeThrough, null));
    } else {
      widget.editorController.formatSelection(Attribute.strikeThrough);
    }
  }

  // 代码块 ******
  void codeBlock() {
    if (invoke('codeBlock')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.codeBlock, null));
    } else {
      widget.editorController.formatSelection(Attribute.codeBlock);
    }
  }

  // 内联代码
  void inlineCode() {
    if (invoke('code')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.inlineCode, null));
    } else {
      widget.editorController.formatSelection(Attribute.inlineCode);
    }
  }

  // 下标 ******
  void subscript() {
    if (invoke('subscript')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.subscript, null));
    } else {
      widget.editorController.formatSelection(Attribute.subscript);
    }
  }

  // 上标 ******
  void superscript() {
    if (invoke('superscript')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.superscript, null));
    } else {
      widget.editorController.formatSelection(Attribute.superscript);
    }
  }

  // 橡皮擦
  void eraser() {
    final attributes = <Attribute>{};
    for (final style in widget.editorController.getAllSelectionStyles()) {
      for (final attr in style.attributes.values) {
        attributes.add(attr);
      }
    }
    for (final attribute in attributes) {
      widget.editorController.formatSelection(Attribute.clone(attribute, null));
    }
  }

  // 有序列表 ******
  void listOl() {
    if (invoke('ol')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.ol, null));
    } else {
      widget.editorController.formatSelection(Attribute.ol);
    }
  }

  // 无序列表 ******
  void listUl() {
    if (invoke('ul')) {
      widget.editorController
          .formatSelection(Attribute.clone(Attribute.ul, null));
    } else {
      widget.editorController.formatSelection(Attribute.ul);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          MenuItem(
            icon: FontAwesomeIcons.eraser,
            onTap: eraser,
          ),
          const VerticalDivider(
            width: 10,
            thickness: 1,
            color: Colors.grey,
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: 45,
                child: Row(
                  children: [
                    MenuItem(
                      icon: FontAwesomeIcons.leftLong,
                      onTap: leftLong,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.rightLong,
                      onTap: rightLong,
                    ),
                    // MenuItem(icon: FontAwesomeIcons.paintRoller),
                    // MenuItem(icon: FontAwesomeIcons.fill),
                    // MenuItem(icon: FontAwesomeIcons.palette),
                    MenuItem(
                      icon: FontAwesomeIcons.bold,
                      onTap: bold,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.italic,
                      onTap: italic,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.underline,
                      onTap: underline,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.strikethrough,
                      onTap: strikethrough,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.code,
                      onTap: codeBlock,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.codeCompare,
                      onTap: inlineCode,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.subscript,
                      onTap: subscript,
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.superscript,
                      onTap: superscript,
                    ),
                    // MenuItem(icon: FontAwesomeIcons.listOl),
                    // MenuItem(icon: FontAwesomeIcons.listUl),
                    // MenuItem(icon: FontAwesomeIcons.indent),
                    // MenuItem(icon: FontAwesomeIcons.outdent),
                    // MenuItem(icon: FontAwesomeIcons.squareCheck),
                    // MenuItem(icon: FontAwesomeIcons.quoteLeft),
                    // MenuItem(icon: FontAwesomeIcons.link),
                    // MenuItem(icon: FontAwesomeIcons.scissors),
                    // MenuItem(icon: FontAwesomeIcons.solidCopy),
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(
            width: 10,
            thickness: 1,
            color: Colors.grey,
            indent: 15,
            endIndent: 15,
          ),
          MenuItem(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            icon: FontAwesomeIcons.bars,
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    this.onTap,
  });

  final IconData icon; // 图标数据
  final VoidCallback? onTap; // 点击回调

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 35,
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
