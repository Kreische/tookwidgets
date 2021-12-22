import 'package:flutter/material.dart';
import 'package:tookwidgets/ui/widget/buttons.dart';
import 'package:tookwidgets/ui/widget/text_widget.dart';

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
          AlertActionBTN(onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  static void snakBar(BuildContext context, {required String content}) {
    final snackBar = SnackBar(
      content: TextWidget(content),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
