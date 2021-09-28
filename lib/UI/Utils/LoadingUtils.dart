import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/UI/Widgets/TextWidget.dart';

class LoadingUtils {
  LoadingUtils._();

  static final LoadingUtils instance = LoadingUtils._();

  bool _isLoading = false;

  void showLoading(BuildContext context, String? text) {
    _isLoading = true;
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
    if (_isLoading) {
      Navigator.pop(context);
    }
  }
}
