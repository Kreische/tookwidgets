import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  DeviceInfo({
    required this.id,
    required this.type,
    required this.platformVersion,
    required this.manufacturer,
    required this.model,
    this.locale = 'en',
    required this.timeZoneName,
    required this.platformId,
    this.fcm,
  });

  factory DeviceInfo.android(AndroidDeviceInfo map) {
    return DeviceInfo(
      id: map.id,
      type: 'android',
      platformVersion: map.version.baseOS,
      manufacturer: map.manufacturer,
      model: map.model,
      platformId: map.androidId,
      timeZoneName: DateTime.now().timeZoneName,
      locale: Platform.localeName.split('_').first,
    );
  }

  factory DeviceInfo.ios(IosDeviceInfo map) {
    return DeviceInfo(
      id: map.identifierForVendor,
      type: 'ios',
      platformVersion: map.systemVersion,
      manufacturer: map.systemName,
      model: map.model,
      platformId: map.utsname.version,
      timeZoneName: DateTime.now().timeZoneName,
      locale: Platform.localeName.split('_').first,
    );
  }

  final String? id;
  final String type;
  final String? platformVersion;
  final String? manufacturer;
  final String? model;
  final String? platformId;
  final String? timeZoneName;
  final String locale;
  final String? fcm;

  DeviceInfo copyWith({
    String? id,
    String? type,
    String? platformVersion,
    String? manufacturer,
    String? model,
    String? platformId,
    String? locale,
    String? timeZoneName,
    String? fcm,
  }) {
    return DeviceInfo(
      id: id ?? this.id,
      type: type ?? this.type,
      platformVersion: platformVersion ?? this.platformVersion,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      platformId: platformId ?? this.platformId,
      locale: locale ?? this.locale,
      timeZoneName: timeZoneName ?? this.timeZoneName,
      fcm: fcm ?? this.fcm,
    );
  }

  Map<String, dynamic> get toMap => {
        'id': id,
        'type': type,
        'platformVersion': platformVersion,
        'manufacturer': manufacturer,
        'model': model,
        'platformId': platformId,
        'timeZoneName': timeZoneName,
        'locale': locale,
        'fcm': fcm,
      };
}
