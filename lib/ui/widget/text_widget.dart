import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.data, {
    this.opacity,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.margin,
    this.maxLines,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.textDecoration,
    this.translate = true,
  });

  final String? data;
  final double? opacity;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? margin;
  final int? maxLines;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? textDecoration;
  final bool translate;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 1,
      child: Container(
        margin: margin,
        child: Text(
          translate ? (data ?? '').tr() : (data ?? ''),
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: maxLines == null ? null : TextOverflow.ellipsis,
          style: TextStyle(
            color: color ?? Theme.of(context).textTheme.bodyText1!.color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            height: height,
            decoration: textDecoration,
          ),
        ),
      ),
    );
  }
}

class ThemedText extends StatelessWidget {
  const ThemedText(
    this.text, {
    Key? key,
    required this.style,
    this.translate = true,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final bool translate;

  @override
  Widget build(BuildContext context) {
    if (translate)
      return Text(
        text,
        style: style,
      ).tr();
    return Text(
      text,
      style: style,
    );
  }
}
