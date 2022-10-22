import 'package:flutter/material.dart';

class CardGradientWidget extends StatelessWidget {
  const CardGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.2577,
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
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.0840,
                  child: const Text(
                    'Setembro 🔽',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.2093,
                height: screenHeight * 0.0840,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: screenWidth * 0.1512,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Text('Saldo'),
              Text('Salve, Mary!'),
            ],
          ),
          const SizedBox(
            child: Text('1.000,00'),
          ),
          Row(
            children: [
              const SizedBox(
                child: Text('Ganhe pontos!'),
              ),
              Image.asset(
                'assets/images/pig-and-coins.png',
                width: screenWidth * 0.5930,
                height: screenHeight * 0.1382,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
