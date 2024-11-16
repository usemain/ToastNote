import 'package:flutter/material.dart';

import '../screen/statistics/index.dart';
import '../screen/home/index.dart';
import '../screen/todos/index.dart';

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
