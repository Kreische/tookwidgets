import 'package:flutter/material.dart';
import 'package:tookwidgets/Constants/AssetString.dart';
import 'package:tookwidgets/Constants/Colors.dart';

import '../Widgets/TextWidget.dart';

mixin AppBarUtils {
  static AppBar customAppBar(
    String title, {
    List<Widget> actions = const [],
    Widget? leading,
    bool autoImplyLeading = true,
  }) {
    return AppBar(
      backgroundColor: MyColors.mainColor,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              AssetString.logoT,
              package: 'tookwidgets',
            ),
          ),
          TextWidget(
            title,
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5),
            fontSize: 20,
          )
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      centerTitle: true,
      toolbarHeight: 65,
      actions: [...actions, const SizedBox(width: 7)],
      leading: leading,
      automaticallyImplyLeading: autoImplyLeading,
    );
  }

  static AppBar forOnlineBTN(
      {Widget? title,
      Widget? leading,
      List<Widget> actions = const [],
      bool centerTitle = false}) {
    return AppBar(
      backgroundColor: MyColors.mainColor,
      title: title,
      leading: leading,
      actions: actions,
      elevation: 30,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      toolbarHeight: 55,
      centerTitle: centerTitle,
    );
  }
}
