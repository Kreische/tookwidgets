import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCircleAvatar extends StatelessWidget {
  const CachedCircleAvatar({
    Key? key,
    required this.imageUrl,
    this.radius = 30,
    this.backgroundColor = Colors.grey,
    this.errorImage,
  }) : super(key: key);
  final String imageUrl;
  final double radius;
  final Color backgroundColor;
  final String? errorImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, string, dd) {
          if (errorImage == null) return const SizedBox();
          return Image.asset(errorImage!);
        },
      ),
    );
  }
}
