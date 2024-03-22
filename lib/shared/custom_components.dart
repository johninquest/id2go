import 'package:flutter/material.dart';
import 'package:idwallet/style/colors.dart';

class CustomDataRow extends StatelessWidget {
  final String? rowName;
  final String? rowData;
  const CustomDataRow({super.key, this.rowName, this.rowData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.89,
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rowName!,
            style: const TextStyle(color: primaryColor),
          ),
          Text(rowData!),
        ],
      ),
    );
  }
}
