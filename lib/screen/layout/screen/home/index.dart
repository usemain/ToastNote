import 'package:flutter/material.dart';
import 'package:toast_note/screen/layout/screen/home/components/info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
