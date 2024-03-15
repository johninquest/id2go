import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import '../../shared/lists/id_category_list.dart';
import '../../utils/date_time_helper.dart';
import '/style/colors.dart';

class IdCreate extends StatelessWidget {
  const IdCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: IdCreateForm()),
    );
  }
}

class IdCreateForm extends StatefulWidget {
  const IdCreateForm({super.key});

  @override
  State<IdCreateForm> createState() => _IdCreateFormState();
}

class _IdCreateFormState extends State<IdCreateForm> {
  final idCreateFormKey = GlobalKey<FormState>();
  String? idCategory;
  String? idType;
  final TextEditingController idName = TextEditingController();
  final TextEditingController idNumber = TextEditingController();
  final TextEditingController idValidFrom = TextEditingController();
  final TextEditingController idValidTo = TextEditingController();
  final TextEditingController idComment = TextEditingController();
  final idCategoryList = idnCategory;
  static List<String> idTypeList = [];

  DateTime selectedDate = DateTime.now();
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        // selectedDate = picked;
        idValidFrom.text = DateTimeHelper().toDeDateFormat('$picked');
        // _pickedDate.text = DateTimeFormatter().toDateString(picked);
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        idValidTo.text = DateTimeHelper().toDeDateFormat('$picked');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: idCreateFormKey,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                          labelText: 'ID Category',
                          labelStyle: TextStyle(color: primaryColor)),
                      items: idCategoryList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: txtBlackColor),
                          ),
                        );
                      }).toList(),
                      validator: (val) => val == null ? 'ID category ?' : null,
                      onChanged: (val) => setState(() {
                        idCategory = val as String;

                        _setIdTypeList(val);
                      }),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                          labelText: 'ID Type',
                          labelStyle: TextStyle(color: primaryColor)),
                      items: idTypeList.isEmpty
                          ? [
                              const DropdownMenuItem(
                                value: '',
                                child: Text('Select Type'),
                              ),
                            ]
                          : idTypeList.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(color: txtBlackColor),
                                ),
                              );
                            }).toList(),
                      validator: (val) => val == null ? 'ID Type ?' : null,
                      onChanged: (val) => setState(() {
                        idType = val as String;
                      }),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: idName,
                      decoration: const InputDecoration(
                          labelText: 'Issuer',
                          labelStyle: TextStyle(color: primaryColor)),
                      style: const TextStyle(color: txtBlackColor),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Issuer ?';
                        }
                        return null;
                      },
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: idNumber,
                      decoration: const InputDecoration(
                          labelText: 'ID Number',
                          labelStyle: TextStyle(color: primaryColor)),
                      style: const TextStyle(color: txtBlackColor),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'ID number ?';
                        }
                        return null;
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          controller: idValidFrom,
                          decoration: const InputDecoration(
                              labelText: 'Valid from',
                              labelStyle: TextStyle(color: primaryColor)),
                          style: const TextStyle(color: txtBlackColor),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          onTap: () => _selectStartDate(context),
                          /* validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Valid from ?';
                            }
                            return null;
                          }, */
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          controller: idValidTo,
                          decoration:
                              const InputDecoration(labelText: 'Valid to'),
                          style: const TextStyle(color: txtBlackColor),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          onTap: () => _selectEndDate(context),
                        )),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: idComment,
                      decoration: const InputDecoration(
                          labelText: 'Comment',
                          labelStyle: TextStyle(color: primaryColor)),
                      style: const TextStyle(color: txtBlackColor),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 2,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        /* onPressed: () => debugPrint('Tapped cancel button'), */
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
                        },
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                              letterSpacing: 1.0, color: primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ));
  }

  void _setIdTypeList(String selectedCategory) {
    // idTypeList = [];
    if (selectedCategory == 'education') {
      idTypeList = subCategoryEducation;
    } else if (selectedCategory == 'finance') {
      idTypeList = subCategoryFinance;
    } else if (selectedCategory == 'government') {
      idTypeList = subCategoryGovernment;
    } else if (selectedCategory == 'insurance') {
      idTypeList = subCategoryInsurance;
    } else if (selectedCategory == 'socialmedia') {
      idTypeList = subCategorySocialMedia;
    } else if (selectedCategory == 'subscription') {
      idTypeList = subCategorySubscription;
    } else if (selectedCategory == 'travel') {
      idTypeList = subCategoryTravel;
    } else if (selectedCategory == 'utilities') {
      idTypeList = subCategoryUtilities;
    }
  }
}
