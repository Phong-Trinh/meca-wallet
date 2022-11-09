import 'package:flutter/material.dart';

class MainNavBar extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final selectedIndex;
  final ValueChanged<int> onClicked;
  const MainNavBar({super.key, this.selectedIndex, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        child: SizedBox(
            height: 96,
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.warehouse_outlined),
                  label: 'Trang chủ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  label: 'Khám phá',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.circle_notifications_outlined),
                //   label: 'Thông báo',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box_outlined),
                  label: 'Tài khoản',
                )
              ],
              currentIndex: selectedIndex,
              selectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              onTap: onClicked,
              iconSize: 24,
              selectedItemColor: const Color.fromARGB(255, 238, 241, 255),
              backgroundColor: const Color.fromARGB(255, 103, 58, 183),
              unselectedItemColor: Colors.white,
            )));
  }
}
