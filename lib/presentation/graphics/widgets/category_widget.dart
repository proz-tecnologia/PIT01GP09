import 'package:finance_app/resources/text_style.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Color color;
  final String category;
  final double totalValue;
  final double percentage;
  const CategoryWidget({
    super.key,
    required this.color,
    required this.category,
    required this.totalValue,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    if (percentage.isNaN) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(category, style: AppTextStyles.description),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'R\$ ${totalValue.toStringAsFixed(2)}',
                  style: AppTextStyles.description,
                ),
                const Text(
                  '0 %',
                  style: AppTextStyles.percentGraphic,
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(category, style: AppTextStyles.description),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'R\$ ${totalValue.toStringAsFixed(2)}',
                  style: AppTextStyles.description,
                ),
                Text(
                  '${percentage.toStringAsFixed(2)} %',
                  style: AppTextStyles.percentGraphic,
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
