import 'package:flutter/material.dart';
import 'package:tookwidgets/src/plugin_consts/colors.dart';
import 'package:tookwidgets/src/plugin_consts/plugin_asset_strings.dart';

import 'text_widget.dart';

class CustomAppBarWithTitleWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithTitleWidget({
    Key? key,
    required this.title,
    this.leading,
    this.actions = const [],
    this.autoImplyLeading = true,
    this.centerTitle = true,
  }) : super(key: key);

  final Widget title;
  final Widget? leading;
  final List<Widget> actions;
  final bool autoImplyLeading;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.mainColor,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              PluginAssetString.logoT,
              package: 'tookwidgets',
            ),
          ),
          title,
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

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions = const [],
    this.autoImplyLeading = true,
  }) : super(key: key);
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final bool autoImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.mainColor,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              PluginAssetString.logoT,
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

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class AppBarForOnlineBTN extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarForOnlineBTN({
    Key? key,
    required this.title,
    this.leading,
    this.actions = const [],
    this.centerTitle = false,
  }) : super(key: key);
  final Widget title;
  final Widget? leading;
  final List<Widget> actions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
