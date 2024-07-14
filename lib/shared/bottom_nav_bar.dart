import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../style/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      // height: 60,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => setState(() {
        currentIndex = index;
        /*  PageRouter().navigateToPage(pages[index], context); */
        afterTap(index);
      }),
      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.home,
            color: primaryColor,
            size: 25.0,
          ),
          label: 'Home',
        ),
        NavigationDestination(
            icon: Icon(
              Icons.add,
              color: primaryColor,
              size: 25.0,
            ),
            label: 'Add new ID'),
        NavigationDestination(
            icon: Icon(
              Icons.list,
              color: primaryColor,
              size: 25.0,
            ),
            label: 'ID List'),
        /*   NavigationDestination(
          icon: Icon(
            Icons.group,
            color: primaryColor,
            size: 25.0,
          ),
          label: 'List',
        ), */
      ],
      // onTap: (index) => afterTap(index),
    );
  }

  void afterTap(int currentIndex) {
    if (currentIndex == 0) {
      //PageRouter().navigateToPage(const HomePage(), context);
      context.go('/home');
    }
    if (currentIndex == 1) {
      // PageRouter().navigateToPage(const CaseListPage(), context);
      context.go('/id-create');
    }
    if (currentIndex == 2) {
      // PageRouter().navigateToPage(const EvaluationsListPage(), context);
      context.go('/id-list');
    }

    /*  if (currentIndex == 3) {
      PageRouter().navigateToPage(const StudentListPage(), context);
    }
    if (currentIndex == 4) {
      PageRouter().navigateToPage(const RequestsListPage(), context);
    } */
  }
}
