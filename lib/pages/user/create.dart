import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New user'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('New user form'),
      ),
    );
  }
}
