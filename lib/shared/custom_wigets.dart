import 'package:flutter/material.dart';
import '../../style/colors.dart';

class CustomDataRow extends StatelessWidget {
  final String? rowName;
  final String? rowData;
  const CustomDataRow({super.key, this.rowName, this.rowData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width * 0.89,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.8, color: primaryColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 1.0, left: 5.0),
            padding: const EdgeInsets.only(bottom: 1.0, left: 5.0),
            child: Text(
              rowName!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: primaryColor),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 1.0, right: 5.0),
            padding: const EdgeInsets.only(bottom: 1.0, right: 5.0),
            child: Text(rowData!.toUpperCase(),
                style: const TextStyle(/* fontWeight: FontWeight.bold */)),
          )
        ],
      ),
    );
  }
}

/* 
class MyTableRowDetails extends StatelessWidget {
  final String? rowName;
  final String? rowData;
  const MyTableRowDetails({super.key, this.rowName, this.rowData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width * 0.89,
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(width: 0.8))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 1.0, left: 5.0),
                padding: const EdgeInsets.only(bottom: 1.0, left: 5.0),
                child: Text(
                  rowName!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 1.0, right: 5.0),
                  padding: const EdgeInsets.only(bottom: 1.0, right: 5.0),
                  child: const Text('')),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 1.0, left: 5.0, right: 1.0),
            padding: const EdgeInsets.only(
                bottom: 5.0, top: 3.0, left: 5.0, right: 1.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              rowData!,
            ),
          )
        ],
      ),
    );
  }
}
 */