import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';
import '../../expenses/page/add_expense_page.dart';

class FormFields extends StatefulWidget {
  const FormFields({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<String> list;

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final DateTime firstDate = DateTime(2022, 1);
  final DateTime lastDate = DateTime(2022, 12);
  final DateTime _date = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  String _dropdownValue = list.first;

  void getInitialDate() async {
    setState(() {
      _dateController.text = DateFormat('dd-MM-yyyy').format(_date);
    });
  }

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2023, 1),
      lastDate: DateTime(2023, 12, 31),
    );
    if (newDate != null) {
      setState(() {
        _dateController.text =
            DateFormat('   dd/MM/yyyy').format(newDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 32.0, right: 32.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.description),
              labelText: Strings.description,
              labelStyle: AppTextStyles.date,
            ),
            style: AppTextStyles.input,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.type_specimen_outlined),
              labelText: Strings.type,
              labelStyle: AppTextStyles.date,
            ),
            style: AppTextStyles.input,
          ),
          FormField<String>(builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.list),
                labelText: Strings.category,
                labelStyle: AppTextStyles.date,
              ),
              isEmpty: _dropdownValue == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  style: AppTextStyles.input,
                  value: _dropdownValue,
                  isDense: true,
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (String? value) {
                    setState(() {
                      _dropdownValue = value!;
                    });
                  },
                  items:
                      widget.list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: const [
                Icon(
                  Icons.calendar_today,
                  color: AppColors.grayDark,
                ),
                Text(
                  Strings.date,
                  style: AppTextStyles.date,
                ),
              ],
            ),
          ),
          FormField<String>(builder: (FormFieldState<String> state) {
            return TextFormField(
              style: AppTextStyles.input,
              readOnly: true,
              controller: _dateController,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayDark, width: 1.0),
                ),
              ),
              onTap: () {
                _selectDate();
              },
            );
          }),
          const SizedBox(
            height: 88,
          ),
        ],
      ),
    );
  }
}
