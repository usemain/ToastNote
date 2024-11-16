import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast_note/config/colors.dart';
import 'package:toast_note/provider/config.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);

    return AppBar(
      elevation: 0,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      backgroundColor: isThemeBgColor(configProvider),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      margin: const EdgeInsets.only(right: 10),
                      child: const ClipOval(
                        child: Image(
                          image: AssetImage("assets/images/head.png"),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "工作台",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: configProvider.isLight
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Welcome back!",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        height: double.infinity,
                      );
                    },
                  );
                },
                child: Stack(
                  children: [
                    SizedBox(
                      width: 19,
                      height: 30,
                      child: Image(
                        width: 19,
                        height: 19,
                        image: configProvider.isLight
                            ? const AssetImage("assets/images/notice_dark.png")
                            : const AssetImage(
                                "assets/images/notice_light.png"),
                      ),
                    ),
                    Positioned(
                      top: 3,
                      right: 0,
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: configProvider.isLight
                                ? Colors.white
                                : Colors.black,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
