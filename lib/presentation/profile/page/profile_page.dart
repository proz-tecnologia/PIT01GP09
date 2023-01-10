import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/text_style.dart';

import '../../home/widgets/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Container(
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
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Profile(),
                        SizedBox(
                          height: height / 30,
                        ),
                        const Text(
                          'Mary',
                          style: AppTextStyles.name1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 2.2),
                  child: Container(
                    color: AppColors.whiteSnow,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height / 2.6, left: width / 20, right: width / 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height / 10),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                                onPressed: () async {},
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
    );
  }
}

Widget infoChild(double width, IconData icon, data) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        child: Row(
          children: [
            SizedBox(
              width: width / 10,
            ),
            Icon(
              icon,
              color: AppColors.blueVibrant,
              size: 36.0,
            ),
            SizedBox(
              width: width / 20,
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
