import 'package:flutter/material.dart';
import 'package:tookwidgets/src/ui/widget/buttons.dart';
import 'package:tookwidgets/src/ui/widget/text_widget.dart';

mixin AlertUtils {
  static void alert(
    BuildContext context, {
    required String title,
    required String? content,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        title: TextWidget(title),
        content: TextWidget(content),
        actions: [
          TookBTN(onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  static void snakBar(
    BuildContext context, {
    required String content,
    Color? textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      content: TextWidget(content, color: textColor),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
