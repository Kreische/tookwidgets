import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/src/plugin_consts/colors.dart';
import 'package:tookwidgets/src/ui/widget/text_widget.dart';

class TookBTN extends StatelessWidget {
  const TookBTN({
    Key? key,
    required this.onPressed,
    this.size,
    this.color = MyColors.mainColor,
    this.text = 'Ok',
    this.padding,
  }) : super(key: key);
  final Function() onPressed;

  final Color color;
  final String text;
  final EdgeInsetsGeometry? padding;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        fixedSize: size,
      ),
      child: TextWidget(text, color: Colors.white),
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
