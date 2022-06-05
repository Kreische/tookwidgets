import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/took_widgets.dart';

class GetBoolDialogAndroid extends StatelessWidget {
  const GetBoolDialogAndroid({
    Key? key,
    required this.title,
    required this.content,
    this.cancelBtnText = 'Cancel',
    this.okBtnText = 'Ok',
  }) : super(key: key);

  final String title;
  final String content;
  final String cancelBtnText;
  final String okBtnText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      title: TextWidget(title),
      content: TextWidget(content),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TookBTN(
          onPressed: () => Navigator.pop(context, false),
          text: cancelBtnText,
          color: Colors.grey,
        ),
        TookBTN(
          onPressed: () => Navigator.pop(context, true),
          text: okBtnText,
        ),
      ],
    );
  }
}

class GetBoolDialogIos extends StatelessWidget {
  const GetBoolDialogIos({
    Key? key,
    required this.title,
    required this.content,
    this.cancelBtnText = 'Cancel',
    this.okBtnText = 'Ok',
  }) : super(key: key);

  final String title;
  final String content;
  final String cancelBtnText;
  final String okBtnText;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: TextWidget(title),
      content: TextWidget(content),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context, false),
          child: TextWidget(
            cancelBtnText,
            color: Colors.grey,
          ),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context, true),
          child: TextWidget(
            okBtnText,
            color: MyColors.accentColor,
          ),
        ),
      ],
    );
  }
}
