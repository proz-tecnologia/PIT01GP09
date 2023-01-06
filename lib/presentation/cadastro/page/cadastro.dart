import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/strings.dart';
import 'package:test/resources/text_style.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
                    "assets/images/cadastro-image.png",
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    height: 210,
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
                              'Cadastro',
                              style: AppTextStyles.applicationSubtitle,
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.account_box_sharp),
                                hintText: 'Nome',
                                hintStyle: AppTextStyles.smallText),
                          ),
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
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: Strings.password,
                              hintStyle: AppTextStyles.smallText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 112,
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
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      child: const Text(
                        'Cadastro',
                        style: AppTextStyles.login,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Já tem conta?',
                        style: AppTextStyles.smallText,
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: const Text(
                          'Faça o login',
                          style: AppTextStyles.link,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 66,
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
