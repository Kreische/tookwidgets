import 'package:device_info/device_info.dart';

class DeviceInfo {
  DeviceInfo({
    required this.id,
    required this.type,
    required this.platformVersion,
    required this.manufacturer,
    required this.model,
    required this.platformId,
    this.fcm,
  });

  factory DeviceInfo.android(AndroidDeviceInfo map) {
    return DeviceInfo(
      id: map.id,
      type: 'Android',
      platformVersion: map.version.baseOS,
      manufacturer: map.manufacturer,
      model: map.model,
      platformId: map.androidId,
    );
  }

  factory DeviceInfo.ios(IosDeviceInfo map) {
    return DeviceInfo(
      id: map.identifierForVendor,
      type: 'iOS',
      platformVersion: map.systemVersion,
      manufacturer: map.systemName,
      model: map.model,
      platformId: map.utsname.version,
    );
  }

  final String? id;
  final String? type;
  final String? platformVersion;
  final String? manufacturer;
  final String? model;
  final String? platformId;
  final String? fcm;

  DeviceInfo copyWith({
    String? id,
    String? type,
    String? platformVersion,
    String? manufacturer,
    String? model,
    String? platformId,
    String? fcm,
  }) {
    return DeviceInfo(
      id: id ?? this.id,
      type: type ?? this.type,
      platformVersion: platformVersion ?? this.platformVersion,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      platformId: platformId ?? this.platformId,
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
        'fcm': fcm,
      };
}
