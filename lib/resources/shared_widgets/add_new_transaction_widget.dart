import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test/data/models/transactions_model.dart';
import 'package:test/locator.dart';
import 'package:test/presentation/income/controller/add_transaction_controller.dart';
import 'package:test/presentation/income/controller/add_transaction_state.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/shared_widgets/numeric_keyboard_widget.dart';
import 'package:test/resources/strings.dart';
import 'package:test/resources/text_style.dart';
import 'dart:ui' as ui;

class AddNewTransactionWidget extends StatefulWidget {
  final List<String> list;
  final Color color;
  final String type;
  const AddNewTransactionWidget({
    Key? key,
    required this.list,
    required this.color,
    required this.type,
  }) : super(key: key);

  @override
  State<AddNewTransactionWidget> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<AddNewTransactionWidget> {
  final _formKey = GlobalKey<FormState>();

  final DateTime firstDate = DateTime(2023, 1);
  final DateTime lastDate = DateTime(2023, 12);
  final DateTime _date = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _keyboardValueController =
      TextEditingController();

  final addTransactionController = AddTransactionController(
      transactionsRepository: getIt(), authRepository: getIt());

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
        _dateController.text = DateFormat('   dd/MM/yyyy').format(newDate);
      });
    }
  }

  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
    addTransactionController.notifier.addListener(() {
      if (addTransactionController.state is AddTransactionSuccessState) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/income', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _formKey,
        appBar: AppBar(
          toolbarHeight: 66,
          backgroundColor: AppColors.blueVibrant,
          elevation: 0,
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: screenWidth,
                    color: widget.color,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 228,
                        child: Row(
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                fit: StackFit.passthrough,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 168,
                                      child: Text(
                                        widget.type,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.greeting,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 138,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            Strings.value,
                                            style: AppTextStyles.greeting,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 80,
                                                width: 350,
                                                child: TextFormField(
                                                  textDirection:
                                                      ui.TextDirection.rtl,
                                                  keyboardType:
                                                      TextInputType.none,
                                                  style:
                                                      AppTextStyles.bigNumber,
                                                  controller:
                                                      _keyboardValueController,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: '00,00',
                                                    hintTextDirection:
                                                        ui.TextDirection.rtl,
                                                    hintStyle:
                                                        AppTextStyles.bigNumber,
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      _numericKeyboardWidgetModalBottomSheet(
                                                          context);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 32.0, right: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.description),
                            labelText: Strings.description,
                            labelStyle: AppTextStyles.date,
                          ),
                          style: AppTextStyles.input,
                        ),
                        FormField<String>(
                            builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.list),
                              labelText: Strings.category,
                              labelStyle: AppTextStyles.date,
                            ),
                            isEmpty: dropdownValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                style: AppTextStyles.input,
                                value: dropdownValue,
                                isDense: true,
                                icon: const Icon(Icons.arrow_downward),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: widget.list
                                    .map<DropdownMenuItem<String>>(
                                        (String text) {
                                  return DropdownMenuItem<String>(
                                    value: text,
                                    child: Text(text),
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
                        FormField<String>(
                            builder: (FormFieldState<String> state) {
                          return TextFormField(
                            style: AppTextStyles.input,
                            readOnly: true,
                            controller: _dateController,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.calendar_month),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grayDark, width: 1.0),
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
                  ),
                  SizedBox(
                    height: 48,
                    width: 304,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.color,
                        ),
                        onPressed: () {
                          if (_keyboardValueController.text.isNotEmpty ||
                              _descriptionController.text.isNotEmpty ||
                              dropdownValue.isNotEmpty) {
                            addTransactionController.addTransaction(
                              TransactionsModel(
                                description: _descriptionController.text,
                                category: dropdownValue,
                                date: _date,
                                type: 'Receita',
                                value: _keyboardValueController.text.isNotEmpty
                                    ? double.parse(
                                        _keyboardValueController.text)
                                    : 0,
                                userId: '',
                              ),
                            );
                          } else {
                            return;
                          }
                        },
                        child: const Text(
                          Strings.add,
                          style: AppTextStyles.greeting,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _numericKeyboardWidgetModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: widget.color,
      builder: (context) {
        return NumericKeyboardWidget(
          color: widget.color,
          type: widget.type,
          keyBoardController: _keyboardValueController,
        );
      },
    );
  }
}
