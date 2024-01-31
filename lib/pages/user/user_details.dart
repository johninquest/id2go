import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../style/colors.dart';
// import 'dart:developer';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal info',
          style: TextStyle(fontSize: 13.0),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: UserInformation(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/user-create'),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [UserInfoRow()]);
  }
}

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 13.0),
          child: const Text(
            'First name',
            style: TextStyle(color: primaryColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 13.0),
          child: const Text('Xaver'),
        )
      ],
    );
  }
}
