import 'package:finance_app/resources/strings.dart';
import 'package:finance_app/resources/text_style.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../resources/colors.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/controller/profile_state.dart';
import 'current_balance.dart';
import 'earn_points.dart';
import 'profile.dart';

class CardGradientWidget extends StatefulWidget {
  const CardGradientWidget({super.key});

  @override
  State<CardGradientWidget> createState() => _CardGradientWidgetState();
}

class _CardGradientWidgetState extends State<CardGradientWidget> {
  final profileController = ProfileController(authRepository: getIt());

  @override
  void initState() {
    super.initState();
    profileController.getUser();
    getUserName();
  }

  Future<String> getUserName() async {
    final user = await profileController.getUser();
    final userName = user.name;
    return userName;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
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
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
                onTap: () => Navigator.of(context).pushNamed('/profile'),
                child: const Profile()),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 1),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        SizedBox(
                          width: 400,
                          height: 175,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ValueListenableBuilder(
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
                                      return Text(
                                        'Salve, ${state.user.name}!',
                                        style: AppTextStyles.greeting,
                                      );
                                    }
                                    return Container();
                                  }),
                              Image.asset(
                                'assets/images/pig-and-coins.png',
                                width: 249,
                                height: 128,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 178,
                          height: 128,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                Strings.balance,
                                style: AppTextStyles.balance,
                              ),
                              CurrentBalance(),
                              EarnPoints(),
                            ],
                          ),
                        ),
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
