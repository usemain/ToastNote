import 'package:flutter/material.dart';
import 'package:toast_note/widgets/custom_scaffold.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: "数据",
      body: Center(child: Text("Data Page")),
    );
  }
}
