import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/strings.dart';
import 'package:test/resources/text_style.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: AppColors.whiteSnow,
          ),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth,
                    height: 20,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color(0xFF645FFB),
                          Color(0xFF05EDE3),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    "assets/images/forgot-image.png",
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              Strings.forgotpassword,
                              style: AppTextStyles.applicationSubtitle,
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: Strings.email,
                                hintStyle: AppTextStyles.smallText),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          width: 120,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.purpleFlower,
                        minimumSize: const Size(369, 54),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                      child: const Text(
                        Strings.submit,
                        style: AppTextStyles.login,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
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
