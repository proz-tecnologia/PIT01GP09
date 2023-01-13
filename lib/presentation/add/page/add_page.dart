import 'package:flutter/material.dart';

import 'package:test/resources/colors.dart';

import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';
import '../widgets/form_fields_widget.dart';
import '../widgets/top_card_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    Key? key,
    required this.color,
    required this.type,
    required this.list,
  }) : super(key: key);

  final Color color;
  final String type;
  final List<String> list;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                  TopCard(
                    color: widget.color,
                    type: widget.type,
                    screenWidth: screenWidth,
                    value: 0,
                  ),
                  FormFields(list: widget.list),
                  SizedBox(
                    height: 48,
                    width: 304,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.color,
                        ),
                        onPressed: () => Navigator.pop(context, true),
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
}
