import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/UI/Widgets/Dialogs.dart';

mixin ConfigUtils {
  Future checkIosTrackingTransperency(BuildContext context) async {
    if (Platform.isIOS) {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      if (status == TrackingStatus.authorized ||
          status == TrackingStatus.notSupported) return true;
      if (status == TrackingStatus.notDetermined ||
          status == TrackingStatus.denied ||
          status == TrackingStatus.restricted) {
        await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => const AppTrackingTransparencyDialog(),
        );
      }
    }
  }
}
