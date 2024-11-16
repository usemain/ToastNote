import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast_note/config/colors.dart';
import 'package:toast_note/provider/config.dart';
import 'package:provider/provider.dart';
import 'package:toast_note/screen/layout/components/drawer.dart';
import 'package:toast_note/screen/layout/components/appbar.dart';
import '../../../native/android_back_desktop.dart';
import '../config/index.dart';

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
        extendBody: true,
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
        bottomNavigationBar: BottomAppBar(
          color:
              configProvider.isLight ? Colors.white : const Color(0xFF171719),
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: const Icon(Icons.savings),
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  }),
              IconButton(
                  icon: const Icon(
                    Icons.donut_large,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  }),
            ],
          ),
        ),
        floatingActionButton: Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: FloatingActionButton(
            foregroundColor: Colors.white,
            hoverColor: Colors.transparent,
            hoverElevation: 0,
            focusColor: Colors.transparent,
            focusElevation: 0,
            splashColor: Colors.transparent,
            highlightElevation: 0,
            elevation: 0,
            onPressed: () {},
            backgroundColor: const Color.fromARGB(255, 249, 212, 5),
            shape: const CircleBorder(),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                FontAwesomeIcons.plus,
                size: 30,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: IndexedStack(
          index: currentIndex,
          children: tabBarPages,
        ),
      ),
    );
  }

  Widget buildBlurryNavigationBar() {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 25,
        sigmaY: 25,
      ),
      child: Container(
        height: 80 + MediaQuery.of(context).padding.bottom,
        color: isThemeBgColor(configProvider).withOpacity(0.8),
        child: Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            backgroundColor: Colors.transparent,
            unselectedItemColor: configProvider.isLight
                ? const Color(0xFFA3A3A3)
                : const Color(0xFF8D8D8D),
            selectedItemColor:
                configProvider.isLight ? Colors.black : Colors.white,
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
          ),
        ),
      ),
    );
  }
}
