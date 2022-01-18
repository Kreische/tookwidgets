import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/src/ui/widget/text_widget.dart';

class LoadingUtils {
  LoadingUtils._();

  static final LoadingUtils instance = LoadingUtils._();

  bool isLoading = false;

  void showLoading(BuildContext context, String? text) {
    isLoading = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoTheme(
            data: CupertinoTheme.of(context)
                .copyWith(brightness: Brightness.dark),
            child: const CupertinoActivityIndicator(),
          ),
          const SizedBox(height: 10),
          TextWidget(
            text,
            color: Colors.white,
            fontSize: 19,
          ),
        ],
      ),
    );
  }

  void removeLoading(BuildContext context) {
    if (isLoading) {
      Navigator.pop(context);
    }
  }
}
