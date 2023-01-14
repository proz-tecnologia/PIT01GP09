import 'package:flutter/material.dart';
import 'package:test/locator.dart';
import 'package:test/presentation/profile/controller/profile_controller.dart';
import 'package:test/presentation/profile/controller/profile_state.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/text_style.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.whiteSnow,
        ),
        child: Stack(
          children: [
            Container(
              height: 420,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
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
            Scaffold(
              backgroundColor: AppColors.transparent,
              body: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Profile(),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Mary',
                            style: AppTextStyles.name1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 424),
                    child: Container(
                      color: AppColors.whiteSnow,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 355, left: 22, right: 22),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 94),
                          child: Column(
                            children: [
                              infoChild(
                                width,
                                Icons.email,
                                'exemplo@gmail.com',
                              ),
                              infoChild(
                                width,
                                Icons.call,
                                '+12-1234567890',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 150, left: 30.0, right: 30.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.purpleFlower,
                                    minimumSize: const Size(369, 54),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
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
                              ),
                            ],
                          ),
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

Widget infoChild(double width, IconData icon, data) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        child: Row(
          children: [
            const SizedBox(
              width: 43.0,
            ),
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
              style: AppTextStyles.description,
            )
          ],
        ),
        onTap: () {},
      ),
    );
