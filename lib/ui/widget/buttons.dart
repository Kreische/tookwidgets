import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/plugin_consts/colors.dart';
import 'package:tookwidgets/ui/widget/text_widget.dart';

class AlertActionBTN extends StatelessWidget {
  const AlertActionBTN({
    Key? key,
    required this.onPressed,
    this.width = 115,
    this.height = 45,
    this.color = MyColors.mainColor,
    this.text = 'Ok',
  }) : super(key: key);
  final Function() onPressed;
  final double width;
  final double height;
  final Color color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: color,
        ),
        child: Center(
          child: TextWidget(
            text,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      this.width,
      this.color,
      this.text = 'Ok'})
      : super(key: key);

  final Function() onPressed;
  final double? width;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        width: width ?? 100,
        height: 55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9),
        ),
        alignment: Alignment.center,
        child: TextWidget(
          text,
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
