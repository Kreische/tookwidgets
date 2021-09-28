import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tookwidgets/Constants/Colors.dart';
import 'package:tookwidgets/UI/Widgets/TextWidget.dart';

mixin Get {
//Navigator
  static void to(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void off(BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => widget),
    );
  }

  static void offAll(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => widget,
      ),
      (Route<dynamic> route) => false,
    );
  }

  // Get Info
  static Future<bool?> getBool(
    BuildContext context,
    String? text, {
    bool barrierDismissible = false,
    String okButtonText = 'OK',
    String cancelButtonText = 'Cancel',
  }) async {
    // final res = await showDialog<bool>(
    //   context: context,
    //   barrierDismissible: barrierDismissible,
    //   builder: (context) => GetBoolDialog(text),
    // );

    final sheet = CupertinoActionSheet(
      message: TextWidget(
        text,
        fontSize: 18,
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context, true),
          child: TextWidget(okButtonText, color: Colors.blue),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context, false),
        child: TextWidget(
          cancelButtonText,
          color: Colors.red,
        ),
      ),
    );
    final res = await showCupertinoModalPopup<bool>(
        context: context, builder: (context) => sheet);
    return res;
  }

  static Future<String?> getText(
    BuildContext context,
    String? initialText, {
    TextInputType? textInputType,
    TextCapitalization? textCapitalization,
  }) async {
    final TextEditingController _textController =
        TextEditingController(text: initialText);
    final text = await showDialog<String>(
      context: context,
      builder: (context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: TextField(
                  controller: _textController,
                  maxLines: null,
                  autofocus: true,
                  keyboardType: textInputType,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                    child: const TextWidget('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(_textController.text);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(MyColors.mainColor),
                      backgroundColor:
                          MaterialStateProperty.all(MyColors.mainColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    child: const TextWidget(
                      'OK',
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    return text;
  }

//

  static Future<File?> pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: source,
      imageQuality: 35,
      maxWidth: 1280,
      maxHeight: 720,
    );
    if (image == null) return null;
    final file = File(image.path);
    return file;
  }

  static Widget loadingIndicator({Color? color}) {
    if (Platform.isAndroid) return const CircularProgressIndicator();
    if (Platform.isIOS) return const CupertinoActivityIndicator();
    return const SizedBox();
  }
}
