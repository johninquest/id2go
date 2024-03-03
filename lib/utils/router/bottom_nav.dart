import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import '../../shared/left_menu.dart';
import '../../style/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
/*   
static final List _body = [
    const HomeButtons(),
    const IdCreate(),
    const IdList(),
  ]; 
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: txtWhiteColor),
        backgroundColor: primaryColor,
        title: const Text(
          '',
          style: TextStyle(color: txtWhiteColor, letterSpacing: 1.0),
        ),
        centerTitle: true,
/*         
        actions: [
          IconButton(
            onPressed: () => context.push('/auth'),
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Log out',
          )
        ], 
        */
      ),
      /* drawer: const LeftMenu(), */
      body: const Center(
          // child: _body.elementAt(currentIndex),
          ),
      drawer: const LeftMenu(),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.add), label: 'Add'),
          NavigationDestination(icon: Icon(Icons.list), label: 'List')
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
