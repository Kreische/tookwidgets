import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/src/plugin_consts/plugin_asset_strings.dart';

class CachedCircleAvatar extends StatelessWidget {
  const CachedCircleAvatar({
    Key? key,
    required this.imageUrl,
    this.radius = 30,
    this.backgroundColor = Colors.white,
    this.errorImage = PluginAssetString.invalidImage,
    this.placeholder = PluginAssetString.invalidImage,
  }) : super(key: key);
  final String imageUrl;
  final double radius;
  final Color backgroundColor;
  final String? placeholder;
  final String? errorImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, text) {
          return _CustomImage(image: placeholder);
        },
        errorWidget: (context, string, dd) {
          return _CustomImage(image: errorImage);
        },
      ),
    );
  }
}

class _CustomImage extends StatelessWidget {
  const _CustomImage({Key? key, required this.image}) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image!,
      package: (image != null) ? 'tookwidgets' : null,
    );
  }
}
