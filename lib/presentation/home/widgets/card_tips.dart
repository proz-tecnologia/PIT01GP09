import 'package:finance_app/resources/colors.dart';
import 'package:flutter/material.dart';

class CardTips extends StatefulWidget {
  final String imageLocation;
  final String cardTitle;
  const CardTips({
    Key? key,
    required this.imageLocation,
    required this.cardTitle,
  }) : super(key: key);

  @override
  State<CardTips> createState() => _CardTipsState();
}

class _CardTipsState extends State<CardTips> {
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.amberPeach,
                image: DecorationImage(
                  image: AssetImage(widget.imageLocation),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 155,
              child: Text(
                widget.cardTitle,
                style: const TextStyle(
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
