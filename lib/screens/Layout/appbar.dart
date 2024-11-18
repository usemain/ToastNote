import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toast_note/shares/colors.dart';
import 'package:toast_note/providers/config.dart';

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
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        "assets/images/obsidian.svg",
                        width: 30,
                        height: 30,
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
                  Navigator.pushNamed(context, "/new_note");
                  // showModalBottomSheet(
                  //   context: context,
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(15),
                  //       topRight: Radius.circular(15),
                  //     ),
                  //   ),
                  //   builder: (context) {
                  //     return Container(
                  //       height: double.infinity,
                  //     );
                  //   },
                  // );
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: commonColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.plus,
                    size: 14,
                    color: Colors.white,
                  ),
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
