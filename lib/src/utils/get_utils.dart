import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tookwidgets/src/plugin_consts/plugin_string_data.dart';
import 'package:tookwidgets/src/ui/widget/bottom_sheets/data_picker.dart';
import 'package:tookwidgets/src/ui/widget/text_widget.dart';

import '../ui/widget/dialog/get_bool_dialog.dart';
import '../ui/widget/dialog/get_text_dialog.dart';

mixin Get {
// Date time picker ;

  static Future<DateTime?> getDateTime(
    BuildContext context, {
    double? height,
    CupertinoDatePickerMode? mode,
    DateTime? initialDateTime,
    DateTime? minimumDateTime,
    DateTime? maximumDateTime,
    bool? use24HourClock,
    Color? backgroundColor,
  }) async {
    final data = await showModalBottomSheet<DateTime?>(
      context: context,
      builder: (context) => DatePicker(
        height: height,
        mode: mode,
        initialDateTime: initialDateTime,
        minimumDateTime: minimumDateTime,
        maximumDateTime: maximumDateTime,
        use24HourClock: use24HourClock,
        backgroundColor: backgroundColor,
      ),
    );
    return data;
  }

  // Get Info
  static Future<bool?> getBool(
    BuildContext context,
    String? text, {
    String title = 'Please confirm',
    bool barrierDismissible = false,
    String okButtonText = PluginStringData.ok,
    String cancelButtonText = PluginStringData.cancel,
  }) async {
    final res = await showDialog<bool>(
        context: context,
        builder: (context) {
          if (Platform.isIOS)
            return GetBoolDialogIos(
              title: title,
              content: text ?? 'Are you sure?',
              okBtnText: okButtonText,
              cancelBtnText: cancelButtonText,
            );

          return GetBoolDialogAndroid(
            title: title,
            content: text ?? 'Are you sure?',
            okBtnText: okButtonText,
            cancelBtnText: cancelButtonText,
          );
        });

    if (res == null) return false;
    return res;
  }

  static Future<String?> getText(
    BuildContext context,
    String? initialText, {
    TextInputType? textInputType,
    TextCapitalization? textCapitalization,
  }) async {
    final text = await showDialog<String>(
      context: context,
      builder: (context) => GetTextDialog(
        initialText: initialText ?? '',
        textInputType: textInputType,
        textCapitalization: textCapitalization,
      ),
    );
    return text;
  }

//

  static Future<File?> imagePicker(BuildContext context) async {
    File? file;
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextWidget(
            'Pick an image source',
            margin: EdgeInsets.all(20),
            fontSize: 18,
            color: Colors.grey,
          ),
          ListTile(
            title: const TextWidget('Camera'),
            onTap: () async {
              file = await _pickImage(ImageSource.camera);
              Navigator.pop(context, file);
            },
            trailing: const Icon(CupertinoIcons.camera),
          ),
          ListTile(
            title: const TextWidget('Galery'),
            onTap: () async {
              file = await _pickImage(ImageSource.gallery);
              Navigator.pop(context, file);
            },
            trailing: const Icon(CupertinoIcons.photo_on_rectangle),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
    return file;
  }

  static Future<File?> _pickImage(ImageSource source) async {
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
