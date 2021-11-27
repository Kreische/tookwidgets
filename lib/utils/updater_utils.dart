import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';
import 'package:tookwidgets/models/address.dart';

import 'location_utils.dart';

enum AppName { driver, passenger }

extension AppNameExt on AppName {
  String get id {
    switch (this) {
      case AppName.driver:
        const driverIOS = 'com.betesla.driver';
        const driverAndroid = 'com.took.driver';
        return Platform.isAndroid ? driverAndroid : driverIOS;
      case AppName.passenger:
        const passengerIOS = 'com.betesla.passenger';
        const passengerAndroid = 'com.betesla.passenger';
        return Platform.isAndroid ? passengerAndroid : passengerIOS;
      default:
        return '';
    }
  }
}

mixin UpdaterUtils {
  static Future checkForUpdate(BuildContext context, AppName name) async {
    Address? address;
    if (Platform.isIOS) {
      address = await LocationUtils.instance.run();
    }
    final version = NewVersion(
      androidId: name.id,
      iOSId: name.id,
      iOSAppStoreCountry: address?.countryCode,
    );

    final versionStatus = await version.getVersionStatus();
    if (versionStatus == null) return;
    final uptodate = versionStatus.localVersion == versionStatus.storeVersion;
    if (uptodate) return;
    version.showUpdateDialog(context: context, versionStatus: versionStatus);
  }
}
