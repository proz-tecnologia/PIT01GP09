import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../locator.dart';
import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';
import '../../login/controller/auth_controller.dart';
import '../../login/controller/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final emailRegex = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");

  final nameRegex = RegExp('[a-zA-Z]');

  final _authController = AuthController(authRepository: getIt());

  void submitSignUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      await _authController.register(_nameController.text,
          _emailController.text, _passwordController.text);
    }
  }

  @override
  void initState() {
    super.initState();
    _authController.state.addListener(() {
      if (_authController.state.value is ErrorAuthState) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(Strings.errorSignUpSnackBar)));
      }
      if (_authController.state.value is SuccessAuthState) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(Strings.successSignUpSnackBar)));
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _authController.state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: SafeArea(
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
                      height: 80,
                    ),
                    SizedBox(
                      height: 245,
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
                                Strings.registration,
                                style: AppTextStyles.applicationSubtitle,
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.account_box_sharp),
                                  hintText: Strings.name,
                                  hintStyle: AppTextStyles.smallText),
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: getNameValidatorWithRegex,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: Strings.email,
                                  hintStyle: AppTextStyles.smallText),
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: getEmailValidatorWithRegex,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: Strings.password,
                                hintStyle: AppTextStyles.smallText,
                                helperText: Strings.passwordHelperText,
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(12)
                              ],
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (password) {
                                final emptyError =
                                    checkEmptyFieldValidator(password);
                                if (emptyError == null && password != null) {
                                  if (password.length < 8) {
                                    return Strings.passwordHelperText;
                                  }
                                }
                                return null;
                              },
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
                      child: ValueListenableBuilder(
                          valueListenable: _authController.state,
                          builder: (_, state, __) {
                            return (state is LoadingAuthState)
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColors.purpleFlower,
                                      minimumSize: const Size(369, 54),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                    ),
                                    onPressed: submitSignUp,
                                    child: const Text(
                                      Strings.registration,
                                      style: AppTextStyles.login,
                                    ),
                                  );
                          }),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          Strings.haveAccount,
                          style: AppTextStyles.smallText,
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/login'),
                          child: const Text(
                            Strings.goToLogin,
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
      ),
    );
  }

  String? getEmailValidatorWithRegex(email) {
    final emptyError = checkEmptyFieldValidator(email);
    if (emptyError == null && email != null) {
      if (!emailRegex.hasMatch(email)) {
        return Strings.errorMessageInvalidEmail;
      }
    }
    return emptyError;
  }

  String? getNameValidatorWithRegex(name) {
    final emptyError = checkEmptyFieldValidator(name);
    if (emptyError == null && name != null) {
      if (!nameRegex.hasMatch(name)) {
        return Strings.errorMessageInvalidEmail;
      }
    }
    return emptyError;
  }

  String? checkEmptyFieldValidator(String? text) {
    if (text == null || text.isEmpty) {
      return Strings.errorMessageEmptyField;
    }
    return null;
  }
}
