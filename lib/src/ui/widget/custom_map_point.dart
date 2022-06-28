import 'package:flutter/material.dart';
import 'package:tookwidgets/src/plugin_consts/plugin_asset_strings.dart';
import 'package:tookwidgets/took_widgets.dart';

class CustomMapPointImage extends StatelessWidget {
  const CustomMapPointImage({
    Key? key,
    required this.index,
    required this.size,
  }) : super(key: key);

  final String index;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          PluginAssetString.mapIcon,
          width: size,
          package: 'tookwidgets',
        ),
        TextWidget(
          index,
          color: Colors.white,
          fontSize: size - 10,
          fontWeight: FontWeight.w700,
          margin: const EdgeInsets.only(bottom: 8),
          translate: false,
        ),
      ],
    );
  }
}
