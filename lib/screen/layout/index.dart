import 'dart:io';
import 'package:flutter/material.dart';
import 'package:toast_note/config/colors.dart';
import 'package:toast_note/provider/config.dart';
import 'package:provider/provider.dart';
import 'package:toast_note/screen/layout/components/drawer.dart';
import 'package:toast_note/screen/layout/components/appbar.dart';
import '../../native/android_back_desktop.dart';
import 'config/index.dart';

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
  void dispose() {
    super.dispose();
    configProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);

    return PopScope<Object>(
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
