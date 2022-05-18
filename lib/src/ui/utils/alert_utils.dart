import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/src/ui/widget/buttons.dart';
import 'package:tookwidgets/src/ui/widget/text_widget.dart';
import 'package:tookwidgets/took_widgets.dart';

mixin AlertUtils {
  static void alert(
    BuildContext context, {
    required String title,
    required String content,
    String actionBtnText = 'Ok',
  }) {
    if (Platform.isAndroid) {
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
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: TextWidget(title),
          content: TextWidget(content),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: TextWidget(
                actionBtnText,
                color: MyColors.accentColor,
              ),
            ),
          ],
        ),
      );
    }
  }

  static void snakBar(BuildContext context, {required String content}) {
    final snackBar = SnackBar(
      content: TextWidget(
        content,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
