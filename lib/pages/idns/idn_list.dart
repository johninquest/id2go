import 'package:flutter/material.dart';
import 'package:idwallet/style/colors.dart';

class IdList extends StatelessWidget {
  const IdList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ID list',
          style: TextStyle(color: txtWhiteColor),
        ),
        centerTitle: true,
      ),
      body: const Center(
          child: Text('List of ID numbers',
              style: TextStyle(color: txtWhiteColor))),
    );
  }
}
