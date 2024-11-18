import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DrawerMenuItem {
  final String label;
  final IconData icon;
  final String routeName;

  DrawerMenuItem(
      {required this.label, required this.icon, required this.routeName});
}

final List<DrawerMenuItem> drawerMenu = [
  DrawerMenuItem(label: '我的', icon: Icons.person, routeName: '/user'),
  DrawerMenuItem(
      label: '数据', icon: Icons.stacked_bar_chart_sharp, routeName: '/data')
];

class LayoutDrawer extends StatefulWidget {
  const LayoutDrawer({super.key});

  @override
  State<LayoutDrawer> createState() => _LayoutDrawerState();
}

class _LayoutDrawerState extends State<LayoutDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: drawerMenu.map((item) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pushNamed(context, item.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: DrawerMenuLabelItem(
                          icon: item.icon,
                          label: item.label,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/settings");
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: EdgeInsets.only(
                top: 40,
                left: 40,
                bottom: MediaQuery.of(context).padding.bottom + 35,
              ),
              child: const DrawerMenuLabelItem(
                icon: Ionicons.cog,
                label: '设置',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerMenuLabelItem extends StatelessWidget {
  const DrawerMenuLabelItem({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
