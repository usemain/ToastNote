import 'dart:io';
import 'package:flutter/material.dart';
import 'package:toast_note/shares/colors.dart';
import 'package:toast_note/providers/config.dart';
import 'package:provider/provider.dart';
import 'package:toast_note/screens/Layout/drawer.dart';
import 'package:toast_note/screens/Layout/appbar.dart';
import '../../shares/android_back_desktop.dart';
import 'Home/index.dart';
import 'Statistics/index.dart';
import 'Todos/index.dart';

final List<Widget> tabBarPages = [
  const HomePage(),
  const StatisticsPage(),
  const TodosPage(),
];

List<BottomNavigationBarItem> buildTabBarItems() {
  return [
    buildBottomNavigationBarItem(Icons.savings, '主页'),
    buildBottomNavigationBarItem(Icons.donut_large, '统计'),
    buildBottomNavigationBarItem(Icons.description, '待办'),
  ];
}

BottomNavigationBarItem buildBottomNavigationBarItem(
  IconData icon,
  String label,
) {
  return BottomNavigationBarItem(
    icon: Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Icon(
        icon,
        size: 26,
      ),
    ),
    label: label,
  );
}

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentIndex = 0;
  late ConfigProvider configProvider;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, dynamic) async {
        if (scaffoldKey.currentState!.isDrawerOpen) {
          scaffoldKey.currentState!.closeDrawer();
          return;
        }

        if (Platform.isAndroid) {
          await AndroidBack.backDeskTop();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        extendBody: false,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        appBar: Appbar(
          scaffoldKey: scaffoldKey,
        ),
        drawerEnableOpenDragGesture: false,
        drawer: const Drawer(
          elevation: 0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: LayoutDrawer(),
        ),
        bottomNavigationBar: SizedBox(
          height: 85 + MediaQuery.of(context).padding.bottom,
          child: buildBlurryNavigationBar(),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabBarPages,
        ),
      ),
    );
  }

  Widget buildBlurryNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      unselectedFontSize: 10,
      selectedFontSize: 10,
      backgroundColor: isThemeBgColor(configProvider),
      unselectedItemColor: configProvider.isLight
          ? const Color(0xFFA3A3A3)
          : const Color(0xFF8D8D8D),
      selectedItemColor: commonColor,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: buildTabBarItems(),
    );
  }
}
