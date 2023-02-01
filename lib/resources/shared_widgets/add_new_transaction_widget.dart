import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/locator.dart';
import 'package:finance_app/presentation/income/controller/add_transaction_controller.dart';
import 'package:finance_app/presentation/income/controller/add_transaction_state.dart';
import 'package:finance_app/presentation/transactions/controller/update_state.dart';
import 'package:finance_app/presentation/transactions/controller/update_transaction_controller.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/resources/shared_widgets/numeric_keyboard_widget.dart';
import 'package:finance_app/resources/strings.dart';
import 'package:finance_app/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'dart:ui' as ui;

class AddNewTransactionWidget extends StatefulWidget {
  final List<String> list;
  final TransactionsModel? transaction;
  final Color color;
  final String type;
  const AddNewTransactionWidget({
    Key? key,
    required this.list,
    required this.color,
    required this.type,
    required this.transaction,
  }) : super(key: key);

  @override
  State<AddNewTransactionWidget> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<AddNewTransactionWidget> {
  final _formKey = GlobalKey<FormState>();

  final DateTime firstDate = DateTime(2023, 1);
  final DateTime lastDate = DateTime(2023, 12);
  final DateTime _date = DateTime.now();
  final MoneyMaskedTextController _keyboardValueController =
      MoneyMaskedTextController(
          decimalSeparator: ',', thousandSeparator: '.', precision: 1);
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final addTransactionController = AddTransactionController(
      transactionsRepository: getIt(), authRepository: getIt());

  final updateTransactionController = UpdateTransactionController(
      transactionsRepository: getIt(), authRepository: getIt());

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      locale: const Locale('pt'),
    );
    if (newDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(newDate);
      });
    }
  }

  late String dropdownValue;

  bool get isEditing => widget.transaction != null;

  TransactionsModel? transaction;

  @override
  void initState() {
    dropdownValue = widget.list.first;
    addTransactionController.notifier.addListener(() {
      if (addTransactionController.state is AddTransactionSuccessState) {
        if (widget.type == Strings.income) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/income', (route) => false);
        }
        if (widget.type == Strings.expense) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/expenses', (route) => false);
        }
      }
    });

    updateTransactionController.notifier.addListener(() {
      if (updateTransactionController.state is UpdateSuccessState) {
        if (widget.type == Strings.income) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/income', (route) => false);
        }
        if (widget.type == Strings.expense) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/expenses', (route) => false);
        }
      }
    });

    if (isEditing) {
      transaction = widget.transaction;
      _dateController.text = DateFormat('dd/MM/yyyy').format(transaction!.date);
      _descriptionController.text = transaction!.description;
      _keyboardValueController.text = transaction!.value.toString();

      dropdownValue = transaction!.category;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String dateHintText = DateFormat('dd/MM/yyyy').format(_date);

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
                                                  readOnly: true,
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
                                                    prefix: Text(
                                                      'R\$ ',
                                                      style:
                                                          AppTextStyles.money,
                                                    ),
                                                    hintText: '0,00',
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
                            decoration: InputDecoration(
                              hintText: dateHintText,
                              prefixIcon: const Text('   '),
                              suffixIcon: const Icon(Icons.calendar_month),
                              enabledBorder: const OutlineInputBorder(
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
                          if (isEditing) {
                            updateTransactionController
                                .updateTransaction(TransactionsModel(
                              id: transaction!.id,
                              category: dropdownValue,
                              date: DateFormat('dd/MM/yyyy')
                                  .parse(_dateController.text),
                              description: _descriptionController.text,
                              type: widget.type,
                              userId: widget.transaction!.userId,
                              value: _keyboardValueController.text.isNotEmpty
                                  ? double.parse(_keyboardValueController.text
                                      .replaceAll('.', '')
                                      .replaceAll(',', '.'))
                                  : 0,
                            ));
                          } else {
                            if (_keyboardValueController.text.isNotEmpty ||
                                _descriptionController.text.isNotEmpty ||
                                dropdownValue.isNotEmpty) {
                              addTransactionController.addTransaction(
                                TransactionsModel(
                                  description: _descriptionController.text,
                                  category: dropdownValue,
                                  date: _dateController.text.isNotEmpty
                                      ? DateFormat('dd/MM/yyyy')
                                          .parse(_dateController.text)
                                      : DateTime.now(),
                                  type: widget.type,
                                  value:
                                      _keyboardValueController.text.isNotEmpty
                                          ? double.parse(
                                              _keyboardValueController.text
                                                  .replaceAll('.', '')
                                                  .replaceAll(',', '.'))
                                          : 0,
                                  userId: '',
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          isEditing ? "Alterar" : Strings.add,
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
