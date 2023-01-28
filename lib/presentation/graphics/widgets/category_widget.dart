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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: color,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(category),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ ${totalValue.toStringAsFixed(2)}',
              ),
              Text(
                '${percentage.toStringAsFixed(2)} %',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
