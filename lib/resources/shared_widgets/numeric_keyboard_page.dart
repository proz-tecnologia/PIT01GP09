import 'package:flutter/material.dart';

import '../colors.dart';
import '../strings.dart';
import '../text_style.dart';

class NumericKeyboardPage extends StatefulWidget {
  const NumericKeyboardPage({super.key});

  @override
  State<NumericKeyboardPage> createState() => _NumericKeyboardPageState();
}

class _NumericKeyboardPageState extends State<NumericKeyboardPage> {
  @override
  Widget build(BuildContext context) {
    var input = '0';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 66,
          backgroundColor: AppColors.blueVibrant,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(input),
                  Container(
                    color: AppColors.grayLight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                child: const Text('1'),
                                onPressed: () {
                                  input += '1';
                                },
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: const Text('2'),
                                onPressed: () {
                                  input += '2';
                                },
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: const Text('3'),
                                onPressed: () {
                                  input += '3';
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                child: const Text('4'),
                                onPressed: () {
                                  input += '4';
                                },
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: const Text('5'),
                                onPressed: () {
                                  input += '5';
                                },
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: const Text('6'),
                                onPressed: () {
                                  input += '6';
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                child: const Text('7'),
                                onPressed: () {
                                  input += '7';
                                },
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: const Text('8'),
                                onPressed: () {
                                  input += '8';
                                },
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: const Text('9'),
                                onPressed: () {
                                  input += '9';
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: const Text('0'),
                                onPressed: () {
                                  input += '0';
                                },
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: const Icon(Icons.backspace),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 48,
                          width: 304,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greenVibrant,
                              ),
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text(
                                Strings.concluded,
                                style: AppTextStyles.greeting,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
