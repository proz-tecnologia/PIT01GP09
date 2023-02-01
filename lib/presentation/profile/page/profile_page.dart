import 'package:finance_app/locator.dart';
import 'package:finance_app/presentation/profile/controller/profile_controller.dart';
import 'package:finance_app/presentation/profile/controller/profile_state.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/resources/text_style.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileController = ProfileController(authRepository: getIt());

  @override
  void initState() {
    super.initState();
    profileController.notifier.addListener(() {
      if (profileController.state is ProfileLogoutState) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
    profileController.getUser();
    getUserName();
    getUserEmail();
  }

  Future<String> getUserName() async {
    final user = await profileController.getUser();
    final userName = user.name;
    return userName;
  }

  Future<String> getUserEmail() async {
    final user = await profileController.getUser();
    final userEmail = user.email;
    return userEmail;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.purpleFlower,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteSnow,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 420,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
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
                  ValueListenableBuilder<ProfileState>(
                      valueListenable: profileController.notifier,
                      builder: (_, state, __) {
                        if (state is ProfileLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: AppColors.greenVibrant,
                          ));
                        }
                        if (state is ProfileErrorState) {
                          return Center(
                            child: Text(state.message),
                          );
                        }
                        if (state is ProfileSuccessState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 64),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Profile(),
                                          const SizedBox(
                                            height: 32,
                                          ),
                                          Text(
                                            state.user.name,
                                            style: AppTextStyles.name1,
                                          ),
                                          const SizedBox(height: 80),
                                          infoChild(
                                            width,
                                            Icons.email,
                                            state.user.email,
                                          ),
                                          infoChild(
                                            width,
                                            Icons.call,
                                            '+12-1234567890',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 120),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColors.purpleFlower,
                                  minimumSize: const Size(309, 54),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                                onPressed: () async {
                                  await profileController.signOut();
                                },
                                child: const Text(
                                  'Sair',
                                  style: AppTextStyles.login,
                                ),
                              ),
                            ],
                          );
                        }
                        return Container();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget infoChild(double width, IconData icon, data) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.blueVibrant,
              size: 36.0,
            ),
            const SizedBox(
              width: 22.0,
            ),
            Text(
              data,
              style: const TextStyle(
                color: AppColors.whiteSnow,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            )
          ],
        ),
        onTap: () {},
      ),
    );
