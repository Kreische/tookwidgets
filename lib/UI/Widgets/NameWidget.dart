import 'package:flutter/material.dart';
import 'package:tookwidgets/Constants/AssetString.dart';
import 'package:tookwidgets/UI/Widgets/TextWidget.dart';

class NameWidget extends StatelessWidget {
  const NameWidget(
    this.name,
    this.isPioneer, {
    Key? key,
    this.fontSize = 18,
    this.imageSize = 20,
    this.fontWeight = FontWeight.w600,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);
  final String? name;
  final bool? isPioneer;
  final double fontSize;
  final double imageSize;
  final FontWeight fontWeight;
  final Color? color;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    if (isPioneer!) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            PluginAssetString.pioneer,
            width: imageSize,
            height: imageSize,
            color: color,
            package: 'tookwidgets',
          ),
          const SizedBox(width: 4),
          _username(),
        ],
      );
    }
    return TextWidget(
      name ?? 'Unknown',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      translate: false,
      maxLines: 1,
    );
  }

  Flexible _username() => Flexible(
        fit: FlexFit.loose,
        child: TextWidget(
          name ?? 'Unknown',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          maxLines: 1,
        ),
      );
}
