import 'package:flutter/material.dart';
import 'package:finance_app/resources/colors.dart';

class CardTips extends StatelessWidget {
  const CardTips({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 276,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.whiteSnow,
        ),
        child: Stack(
          children: [
            Container(
              height: 149,
              width: 276,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.amberPeach,
              ),
            ),
            const Positioned(
              left: 10,
              top: 155,
              child: Text(
                'Dicas para economizar na quebrada',
                style: TextStyle(
                  color: AppColors.blackSwan,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              bottom: 22,
              right: 16,
              child: Row(children: const [
                Text(
                  '+ ARTIGOS',
                  style: TextStyle(
                    color: AppColors.grayDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'LEIA MAIS',
                  style: TextStyle(
                    color: AppColors.grayDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ]),
            )
          ],
        ));
  }
}
