import 'package:flutter/material.dart';

class GeneralContainer extends StatelessWidget {
  const GeneralContainer({
    Key? key,
    required this.child,
    this.color = Colors.white,
    this.padding = const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 10,
    ),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  }) : super(key: key);
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Color(0x21666666),
            offset: Offset(0, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: child,
    );
  }
}
