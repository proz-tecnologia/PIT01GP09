import 'package:flutter/material.dart';

import 'package:finance_app/resources/colors.dart';
import '../../../resources/text_style.dart';
import 'num_pad.dart';

class NumericKeyboardWidget extends StatefulWidget {
  final TextEditingController keyBoardController;

  const NumericKeyboardWidget({
    Key? key,
    required this.color,
    required this.type,
    required this.keyBoardController,
  }) : super(key: key);

  final Color color;
  final String type;

  @override
  State<NumericKeyboardWidget> createState() => _NumericKeyboardWidgetState();
}

class _NumericKeyboardWidgetState extends State<NumericKeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          SizedBox(
            height: 140,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              fit: StackFit.passthrough,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    widget.type,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.greeting,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
                  child: SizedBox(
                    height: 138,
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      controller: widget.keyBoardController,
                      style: AppTextStyles.bigNumber,
                      showCursor: false,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefix: Text(
                          'R\$ ',
                          style: AppTextStyles.money,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 605,
            decoration: const BoxDecoration(
              color: AppColors.graySuperLight,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: NumPad(
                type: widget.type,
                buttonSize: 75,
                buttonColor: AppColors.whiteSnow,
                iconColor: AppColors.grayTwo,
                controller: widget.keyBoardController,
                delete: () {
                  if (widget.keyBoardController.text.isNotEmpty) {
                    widget.keyBoardController.text =
                        widget.keyBoardController.text.substring(
                            0, widget.keyBoardController.text.length - 1);
                  } else {
                    widget.keyBoardController.text = '';
                  }
                },
                onSubmit: () {
                  setState(() {
                    Navigator.pop(context, widget.keyBoardController.text);
                  });
                }),
          ),
        ],
      ),
    );
  }
}
