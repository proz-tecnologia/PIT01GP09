import 'package:flutter/material.dart';

import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';

class TopCard extends StatefulWidget {
  const TopCard({
    Key? key,
    required this.color,
    required this.type,
    required this.screenWidth,
  }) : super(key: key);

  final Color color;
  final String type;

  final double screenWidth;

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth,
      color: widget.color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 228,
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  fit: StackFit.passthrough,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 168,
                        child: Text(
                          widget.type,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.greeting,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 138,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              Strings.value,
                              style: AppTextStyles.greeting,
                            ),
                            InkWell(
                              child: const Text(
                                Strings.valueZero,
                                style: AppTextStyles.bigNumber,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, '/keyboard'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
