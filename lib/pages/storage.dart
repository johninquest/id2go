import 'package:flutter/material.dart';

class StorageSettingPage extends StatelessWidget {
  const StorageSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select storage type'),
        centerTitle: true,
      ),
      body: const Center(
        child: StorageTypeSwitch(),
      ),
    );
  }
}

class StorageTypeSwitch extends StatefulWidget {
  const StorageTypeSwitch({super.key});

  @override
  State<StorageTypeSwitch> createState() => _StorageTypeSwitchState();
}

class _StorageTypeSwitchState extends State<StorageTypeSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  debugPrint('Selected value: $value');
                  isSwitched = value;
                });
              }),
          Container(
            margin: const EdgeInsets.only(top: 21.0),
            child: Text(
              showSelectedOption(isSwitched),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  showSelectedOption(bool val) {
    if (val == true) {
      return 'Cloud';
    }
    if (val == false) {
      return 'Offline';
    }
  }
}
