import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/shared/id_categories.dart';
import '/style/colors.dart';

class IdCreate extends StatelessWidget {
  const IdCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: IdCreateForm(),
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
  String? categoryName;
  final TextEditingController idName = TextEditingController();
  final TextEditingController idNumber = TextEditingController();
  final TextEditingController idDesc = TextEditingController();
/*   TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController(); */
  // TextEditingController _estimatedHours = TextEditingController();

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

  @override
  void initState() {
    DateTime now = DateTime.now();
    _startDate.text = DateTimeHelper().toDeDateFormat('$now');
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    const idCategoryList = ID_CATEGORIES_LIST;
    return Form(
        key: idCreateFormKey,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: 'Category'),
                      // items: DataAsList().taskListItems,
                      items: idCategoryList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),

                      validator: (val) => val == null ? 'ID category ?' : null,
                      onChanged: (val) => setState(() {
                        categoryName = val as String;
                      }),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: idName,
                      decoration: const InputDecoration(labelText: 'ID name'),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'ID name ?';
                        }
                        return null;
                      },
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: idNumber,
                      decoration: const InputDecoration(labelText: 'ID number'),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'ID number ?';
                        }
                        return null;
                      },
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      controller: idDesc,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
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
                        style: ElevatedButton.styleFrom(),
                        child: const Text(
                          'cancel',
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
                          'save',
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ));
  }
}
