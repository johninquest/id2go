import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../style/colors.dart';

class VersionInfo extends StatefulWidget {
  const VersionInfo({super.key});

  @override
  State<VersionInfo> createState() => _VersionInfoState();
}

class _VersionInfoState extends State<VersionInfo> {
  final Future<PackageInfo> _packageInfo = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<PackageInfo>(
            future: _packageInfo,
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasError) {
                return const Text('ERROR');
              } else if (!snapshot.hasData) {
                return const Text('Loading...');
              }

              final data = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('App Name: ${data.appName}',
                      style: const TextStyle(color: txtWhiteColor)),
                  Text('Package Name: ${data.packageName}',
                      style: const TextStyle(color: txtWhiteColor)),
                  Text('Version: ${data.version}',
                      style: const TextStyle(color: txtWhiteColor)),
                  Text('Build Number: ${data.buildNumber}',
                      style: const TextStyle(color: txtWhiteColor)),
                ],
              );
            }));
  }
}
