import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions = const [],
    this.onBack,
  });

  final String title;
  final Widget body;
  final List<Widget> actions;
  final VoidCallback? onBack;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(widget.title),
        leadingWidth: 45,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (widget.onBack != null) {
              widget.onBack!();
            } else {
              Navigator.pop(context);
            }
          },
          child: SizedBox(
            width: 45,
            child: Center(
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFFEC6A5E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  FontAwesomeIcons.xmark,
                  size: 14,
                  color: Color(0xFF8B1A10),
                ),
              ),
            ),
          ),
        ),
        actions: widget.actions,
      ),
      body: widget.body,
    );
  }
}
