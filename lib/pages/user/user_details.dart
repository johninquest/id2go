import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/custom_wigets.dart';
import '../../style/colors.dart';
import '../../utils/db/sp_helper.dart';
import 'dart:convert';
/* import '../../shared/lists/countries.dart';
import '../../style/colors.dart';
import '../../utils/date_time_helper.dart'; */

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SpHelper().retrieveFromSharedPrefs('user_data'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String? dataStr = snapshot.data!;
            Map<String, dynamic> dataObj = jsonDecode(dataStr);
            debugPrint('User data: $dataStr');
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'User info',
                ),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /* Container(
                        width: MediaQuery.of(context).size.width * 0.89,
                        margin: const EdgeInsets.all(21.0),
                        child: Center(child: Text(dataStr))), */
                    CustomDataRow(
                      rowName: 'First name',
                      rowData: dataObj['_firstName'] ?? '',
                    ),
                    CustomDataRow(
                      rowName: 'Last name',
                      rowData: dataObj['_lastName'] ?? '',
                    ),
                    CustomDataRow(
                      rowName: 'Date of birth',
                      rowData: dataObj['_dateOfBirth'] ?? '',
                    ),
                    CustomDataRow(
                      rowName: 'Country',
                      rowData: dataObj['_countryName'] ?? '',
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                        onPressed: () => context.push('/user-create'),
                        child: const Text('EDIT'))
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            // child: CircularProgressIndicator(),
            child: ElevatedButton(
                onPressed: () => context.push('/user-create'),
                child: const Icon(Icons.add)),
          );
        });
  }
}

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    super.key,
    required this.fieldTitle,
    required this.fieldValue,
  });
  final String fieldTitle;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 21.0, bottom: 5.0),
          child: Text(
            fieldTitle,
            style: const TextStyle(color: primaryColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 21.0),
          child: Text(fieldValue, style: const TextStyle(color: txtBlackColor)),
        )
      ],
    );
  }
}
