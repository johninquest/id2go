import 'package:flutter/material.dart';

class IdReadPage extends StatelessWidget {
  const IdReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read ID'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Read ID'),
      ),
    );
  }
}
