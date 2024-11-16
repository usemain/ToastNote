import 'package:flutter/material.dart';
import 'package:toast_note/widget/custom_scaffold.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: "我的",
      body: Center(child: Text("User Page")),
    );
  }
}
