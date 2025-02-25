import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants/colors_constants.dart';
import 'package:task_management_app/core/utils/styles/text_style.dart';
import 'package:task_management_app/features/my_tasks/view/my_task_screen.dart';
import 'package:task_management_app/features/tasks/view/task_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0 ;

  final List<Widget> _pages = [
    const TaskScreen(),
    const MyTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedLabelStyle: mainBold14.copyWith(color: neutral.shade500),
        unselectedLabelStyle: mainMedium14.copyWith(color: neutral.shade500),
        selectedItemColor: neutral.shade500,
        unselectedItemColor: neutral.shade500,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list,color: _currentIndex == 0 ? primary.shade500 : neutral.shade500,),
            label: 'TASKS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline,color: _currentIndex == 1 ? primary.shade500 : neutral.shade500),
            label: 'MY TASKS',
          ),
        ],
      ),
    );
  }
}


