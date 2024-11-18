import 'package:flutter/material.dart';

// 个人中心菜单栏
const List<Map<String, String>> menus = [
  {'title': '主题'},
];

class Menus extends StatelessWidget {
  const Menus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: menus.map((item) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pushNamed(context, '/theme');
          },
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
