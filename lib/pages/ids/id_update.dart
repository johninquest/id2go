import 'package:flutter/material.dart';

class IdUpdatePage extends StatelessWidget {
  const IdUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update ID'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Update ID Page'),
      ),
    );
  }
}
