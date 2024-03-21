import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../utils/db/sp_helper.dart';
import 'dart:convert';
import '../../shared/lists/countries.dart';
import '../../style/colors.dart';
import '../../utils/date_time_helper.dart';

class UserCreatePage extends StatelessWidget {
  const UserCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit user information'),
        centerTitle: true,
      ),
      body: const Center(
        child: NewUserForm(),
      ),
    );
  }
}

class NewUserForm extends StatefulWidget {
  const NewUserForm({super.key});

  @override
  State<NewUserForm> createState() => _NewUserFormState();
}

class _NewUserFormState extends State<NewUserForm> {
  final userFormKey = GlobalKey<FormState>();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  // final TextEditingController countryName = TextEditingController();
  String? countryName;
  bool isEnabled = false;

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        // selectedDate = picked;
        dateOfBirth.text = DateTimeHelper().toDeDateFormat('$picked');
        // _pickedDate.text = DateTimeFormatter().toDateString(picked);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final sp = SpHelper();
    sp.retrieveFromSharedPrefs('user_data').then((val) => setState(() {
          if (val != null) {
            Map<String, dynamic> data = jsonDecode(val);
            debugPrint('Retrieved data: $data');
            firstName.text = data['_firstName'] ?? '';
            lastName.text = data['_lastName'] ?? '';
            dateOfBirth.text = data['_dateOfBirth'] ?? '';
            countryName = data['_countryName'] ?? '';
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: userFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.89,
                margin: const EdgeInsets.only(bottom: 5.0),
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: TextFormField(
                  controller: firstName,
                  enabled: true,
                  decoration: const InputDecoration(
                      labelText: 'First name',
                      labelStyle: TextStyle(color: primaryColor)),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.89,
                margin: const EdgeInsets.only(bottom: 5.0),
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: TextFormField(
                  controller: lastName,
                  enabled: true,
                  decoration: const InputDecoration(
                      labelText: 'Last name',
                      labelStyle: TextStyle(color: primaryColor)),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.89,
                margin: const EdgeInsets.only(bottom: 5.0),
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: TextFormField(
                  controller: dateOfBirth,
                  enabled: true,
                  decoration: const InputDecoration(
                      labelText: 'Date of birth',
                      labelStyle: TextStyle(color: primaryColor)),
                  onTap: () => _selectDateOfBirth(context),
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.89,
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: DropdownButtonFormField(
                  value: countryName,
                  decoration: const InputDecoration(
                      labelText: 'Country',
                      labelStyle: TextStyle(color: primaryColor)),
                  items: countryList.map((String countryValue) {
                    return DropdownMenuItem<String>(
                      value: countryValue,
                      child: Text(
                        countryValue,
                        style: const TextStyle(color: txtBlackColor),
                      ),
                    );
                  }).toList(),
                  // validator: (val) => val == null ? 'Country ?' : null,
                  onChanged: (val) => setState(() {
                    countryName = val as String;
                  }),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(),
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(color: txtBlackColor),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Tapped save button');
                      Map<String, dynamic> userData = {
                        '_firstName': firstName.text,
                        '_lastName': lastName.text,
                        '_dateOfBirth': dateOfBirth.text,
                        '_countryName': countryName
                      };
                      debugPrint('User data: $userData');
                      if (userFormKey.currentState!.validate()) {
                        String userDataStr = jsonEncode(userData);
                        final sharedPrefs = SpHelper();
                        sharedPrefs
                            .storeInSharedPrefs('user_data', userDataStr)
                            .then((value) => setState(() {
                                  context.push('/user-details');
                                }));
                      }
                    },
                    child: const Text('SAVE'),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
