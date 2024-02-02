import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/pages/ids/id_create.dart';
import '/pages/ids/id_list.dart';
import '../../shared/left_menu.dart';
import '../style/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  static final List _body = [
    const HomeButtons(),
    /*  const Icon(
      Icons.list,
      size: 55.0,
    ), */
/*     Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
      ),
      body: const Center(
        child: Icon(
          Icons.person,
          size: 55.0,
        ),
      ),
    ), */
    const IdCreate(),
    const IdList(),
  ];

  @override
  Widget build(BuildContext context) {
    // final dtHelper = DateTimeHelper();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: txtWhiteColor),
        backgroundColor: primaryColor,
        title: const Text(
          '',
          style: TextStyle(color: txtWhiteColor, letterSpacing: 1.0),
        ),
        centerTitle: true,
        actions: [
          /* IconButton(
            onPressed: () => showDialog(
                context: context,
                builder: (_) => const LogoutDialog(),
                barrierDismissible: true),
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Log out',
          ) */
          IconButton(
            onPressed: () => context.push('/auth'),
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Log out',
          )
        ],
      ),
      /* drawer: const LeftMenu(), */
      body: Center(
        child: _body.elementAt(currentIndex),
      ),
      /* bottomNavigationBar: const BottomNavBar(), */
      drawer: const LeftMenu(),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          // NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
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

class HomeButtons extends StatelessWidget {
  const HomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 55.0,
          margin: const EdgeInsets.only(bottom: 5.0, top: 5.0),
          child: ElevatedButton(
              onPressed: () => debugPrint('Tapped button #1'),
              child: const Text('#1')),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 55.0,
          margin: const EdgeInsets.only(bottom: 5.0, top: 5.0),
          child: ElevatedButton(
              onPressed: () => debugPrint('Tapped button #2'),
              child: const Text('#2')),
        ),
      ],
    );
  }
}
