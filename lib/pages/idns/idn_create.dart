import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import '../../shared/lists/id_category_list.dart';
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
  /*  final categoryFinanceList = subCategoryFinance;
  final categoryGovermentList = subCategoryGovernment;
  final categoryInsuranceList = subCategoryInsurance;
  final categoryEducationList = subCategoryEducation; */

/*   TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController(); */

/*   DateTime selectedDate = DateTime.now();
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        // selectedDate = picked;
        _startDate.text = DateTimeHelper().toDeDateFormat('$picked');
        // _pickedDate.text = DateTimeFormatter().toDateString(picked);
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        _endDate.text = DateTimeHelper().toDeDateFormat('$picked');
      });
  }
  */
/* 
  @override
  void initState() {
    if (idCategory == 'education') {
      setState(() {
        idTypeList = subCategoryEducation;
      });
    }
    if (idCategory == 'finance') {
      setState(() {
        idTypeList = subCategoryFinance;
      });
    }
    super.initState();
  } */

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
                      decoration:
                          const InputDecoration(labelText: 'ID Category'),
                      items: idCategoryList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: primaryColor),
                          ),
                        );
                      }).toList(),
                      validator: (val) => val == null ? 'ID category ?' : null,
                      onChanged: (val) => setState(() {
                        idCategory = val as String;
                        _setIdTypeList(val);
                        /*   if (val == 'education') {
                          idTypeList = subCategoryEducation;
                        }
                        if (val == 'finance') {
                          idTypeList = subCategoryFinance;
                        }
                        if (val == 'government') {
                          idTypeList = subCategoryGovernment;
                        }
                        if (val == 'insurance') {
                          idTypeList = subCategoryInsurance;
                        } */
                      }),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: 'ID Type'),
                      items: idTypeList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
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
                      decoration: const InputDecoration(labelText: 'Issuer'),
                      style: const TextStyle(color: txtWhiteColor),
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
                          labelText: 'ID Number', fillColor: txtWhiteColor),
                      style: const TextStyle(color: txtWhiteColor),
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
                          decoration:
                              const InputDecoration(labelText: 'Valid from'),
                          style: const TextStyle(color: txtWhiteColor),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Valid from ?';
                            }
                            return null;
                          },
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          controller: idValidTo,
                          decoration:
                              const InputDecoration(labelText: 'Valid to'),
                          style: const TextStyle(color: txtWhiteColor),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Valid to ?';
                            }
                            return null;
                          },
                        )),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: idComment,
                      decoration: const InputDecoration(labelText: 'Comment'),
                      style: const TextStyle(color: txtWhiteColor),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 2,
                    )),
/*                 Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: _startDate,
                      enabled: true,
                      readOnly: true,
                      decoration: const InputDecoration(labelText: 'Beginn'),
                      onTap: () => _selectStartDate(context),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: _endDate,
                      enabled: true,
                      readOnly: true,
                      decoration: const InputDecoration(labelText: 'Ende'),
                      onTap: () => _selectEndDate(context),
                    )), */
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
    if (selectedCategory == 'education') {
      idTypeList = subCategoryEducation;
    }
    if (selectedCategory == 'finance') {
      idTypeList = subCategoryFinance;
    }
    if (selectedCategory == 'government') {
      idTypeList = subCategoryGovernment;
    }
    if (selectedCategory == 'insurance') {
      idTypeList = subCategoryInsurance;
    }
  }
}
