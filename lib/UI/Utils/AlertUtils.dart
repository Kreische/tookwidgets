import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/UI/Widgets/Buttons.dart';
import 'package:tookwidgets/UI/Widgets/TextWidget.dart';

mixin AlertUtils {
  static void alert(
    BuildContext context, {
    required String title,
    required String content,
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
}
