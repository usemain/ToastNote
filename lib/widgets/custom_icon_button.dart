import 'package:flutter/material.dart';
import 'package:toast_note/shares/colors.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconColor = Colors.white,
    this.bgColor = commonColor,
    this.padding = const EdgeInsets.only(right: 15),
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final EdgeInsetsGeometry padding;
  final Function onTap;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          widget.onTap();
        },
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            widget.icon,
            size: 14,
            color: widget.iconColor,
          ),
        ),
      ),
    );
  }
}
