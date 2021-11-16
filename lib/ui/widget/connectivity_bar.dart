import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tookwidgets/plugin_consts/colors.dart';

import 'package:tookwidgets/plugin_consts/plugin_string_data.dart';

import 'text_widget.dart';

class ConnectivityBar extends StatefulWidget {
  const ConnectivityBar({Key? key, this.onConnectionUpdate}) : super(key: key);
  final Function(InternetConnectionStatus?)? onConnectionUpdate;

  @override
  State<ConnectivityBar> createState() => _ConnectivityBarState();
}

class _ConnectivityBarState extends State<ConnectivityBar> {
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
