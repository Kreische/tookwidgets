import 'package:flutter/material.dart';

import 'TextWidget.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key? key,
    required this.title,
    required this.amount,
    this.image,
    this.icon,
    this.color = Colors.white,
  }) : super(key: key);
  final String? title;
  final String amount;
  final String? image;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextWidget(
              amount,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            const SizedBox(width: 6),
            if (image != null)
              Image.asset(image!, width: 25, height: 25, color: color),
            if (icon != null) Icon(icon, color: color, size: 25),
          ],
        ),
        TextWidget(
          title,
          fontSize: 12,
          color: color,
        ),
      ],
    );
  }
}
