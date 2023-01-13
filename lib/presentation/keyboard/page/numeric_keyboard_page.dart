import 'package:flutter/material.dart';
import 'package:test/presentation/keyboard/widgets/num_pad.dart';

import 'package:test/resources/colors.dart';
import '../../../resources/text_style.dart';

class NumericKeyboardPage extends StatefulWidget {
  const NumericKeyboardPage({
    Key? key,
    required this.color,
    required this.type,
  }) : super(key: key);

  final Color color;
  final String type;

  @override
  State<NumericKeyboardPage> createState() => _NumericKeyboardPageState();
}

class _NumericKeyboardPageState extends State<NumericKeyboardPage> {
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
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
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      height: 175,
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
                            padding: const EdgeInsets.only(
                                left: 20, top: 29, right: 20),
                            child: SizedBox(
                              height: 138,
                              child: TextFormField(
                                textDirection: TextDirection.rtl,
                                controller: _myController,
                                style: AppTextStyles.bigNumber,
                                showCursor: false,
                                keyboardType: TextInputType.none,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefix: Text(
                                    'R\$ ',
                                    style: AppTextStyles.money,
                                  ),
                                  // contentPadding: EdgeInsets.only(left: 100),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 702,
                    decoration: const BoxDecoration(
                      color: AppColors.graySuperLight,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: NumPad(
                      type: widget.type,
                      buttonSize: 75,
                      buttonColor: AppColors.whiteSnow,
                      iconColor: AppColors.grayTwo,
                      controller: _myController,
                      delete: () {
                        _myController.text = _myController.text
                            .substring(0, _myController.text.length - 1);
                      },
                      // do something with the input numbers
                      onSubmit: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
