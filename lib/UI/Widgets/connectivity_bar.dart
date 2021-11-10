import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:tookwidgets/Constants/Colors.dart';
import 'package:tookwidgets/Constants/PluginStringData.dart';

import 'TextWidget.dart';

class NoInternetConnectionBar extends StatefulWidget {
  const NoInternetConnectionBar({Key? key, this.onConnectionUpdate})
      : super(key: key);
  final Function(InternetConnectionStatus?)? onConnectionUpdate;

  @override
  State<NoInternetConnectionBar> createState() =>
      _NoInternetConnectionBarState();
}

class _NoInternetConnectionBarState extends State<NoInternetConnectionBar> {
  late InternetConnectionChecker internetConnectionChecker;
  @override
  void initState() {
    internetConnectionChecker = InternetConnectionChecker();
    internetConnectionChecker.onStatusChange.listen(widget.onConnectionUpdate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<InternetConnectionStatus>(
        stream: internetConnectionChecker.onStatusChange.asBroadcastStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.data == InternetConnectionStatus.disconnected)
            return Container(
              color: MyColors.mainColor,
              height: 30,
              alignment: Alignment.center,
              child: const TextWidget(
                PluginStringData.noInternetError,
                color: Colors.white,
              ),
            );

          return const SizedBox();
        });
  }
}
