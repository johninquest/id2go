import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../style/colors.dart';
import '../../utils/db/sp_helper.dart';
import 'dart:convert';
import '../../shared/lists/countries.dart';
import '../../style/colors.dart';
import '../../utils/date_time_helper.dart';

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
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.89,
                      margin: const EdgeInsets.all(21.0),
                      child: Center(child: Text(dataStr))),
                  ElevatedButton(
                      onPressed: () => context.push('/user-create'),
                      child: const Text('EDIT'))
                ],
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

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UserInfoRow(
            fieldTitle: 'First name',
            fieldValue: 'Mike',
          ),
          /*  const Divider(
            indent: 89.0,
            endIndent: 89.0,
          ), */
          const UserInfoRow(
            fieldTitle: 'Last name',
            fieldValue: 'Xaver',
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () => debugPrint('Tapped delete button'),
                  style: ElevatedButton.styleFrom(),
                  child: const Text(
                    'DELETE',
                    style: TextStyle(color: txtBlackColor),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () => debugPrint('Tapped edit button'),
                  child:
                      const Text('EDIT', style: TextStyle(color: primaryColor)),
                ),
              )
            ],
          )
        ]);
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
