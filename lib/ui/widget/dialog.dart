import 'package:app_settings/app_settings.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';
import 'text_widget.dart';

class AppTrackingTransparencyDialog extends StatelessWidget {
  const AppTrackingTransparencyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Please press "Allow Tracking" on the next screen';
    const text =
        'This let us know where you are when requesting a ride from A to point B';
    return AlertDialog(
      title: const TextWidget(title, textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextWidget(text, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          AlertActionBTN(
            onPressed: () => _setTrackingPermission(context),
            text: 'Next',
          ),
        ],
      ),
    );
  }

  Future _setTrackingPermission(BuildContext context) async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if ([TrackingStatus.authorized, TrackingStatus.notSupported]
        .contains(status)) return Navigator.pop(context, true);
    if (status == TrackingStatus.notDetermined) {
      Navigator.pop(context, true);
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
    if (status == TrackingStatus.restricted ||
        status == TrackingStatus.denied) {
      Navigator.pop(context, true);
      await AppSettings.openAppSettings();
    }
  }
}
