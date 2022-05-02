import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/src/ui/widget/dialog.dart';

mixin ConfigUtils {
  static Future checkIosTrackingTransperency(BuildContext context) async {
    if (Platform.isIOS) {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      if (status == TrackingStatus.authorized ||
          status == TrackingStatus.notSupported ||
          status == TrackingStatus.denied ||
          status == TrackingStatus.restricted) return true;
      if (status == TrackingStatus.notDetermined) {
        await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => const AppTrackingTransparencyDialog(),
        );
      }
    }
  }
}
