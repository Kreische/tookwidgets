import 'package:device_info/device_info.dart';

class DeviceInfo {
  DeviceInfo({
    this.id,
    this.type,
    this.adroidVersion,
    this.manufacturer,
    this.model,
    this.androidId,
  });

  factory DeviceInfo.android(AndroidDeviceInfo build) {
    return DeviceInfo(
      id: build.id,
      type: 'Android',
      adroidVersion: build.version.release,
      manufacturer: build.manufacturer,
      model: build.model,
      androidId: build.androidId,
    );
  }

  // factory DeviceInfo.ios(IosDeviceInfo data) {
  //   return DeviceInfo(
  //     id: data.identifierForVendor,
  //     type: 'Android',
  //     adroidVersion: build.version.release,
  //     manufacturer: build.manufacturer,
  //     model: build.model,
  //     androidId: build.androidId,
  //   );
  // }

  final String? id;
  final String? type;
  final String? adroidVersion;
  final String? manufacturer;
  final String? model;
  final String? androidId;

  Map<String, dynamic> get toMap => {
        'id': id,
        'type': type,
        'adroidVersion': adroidVersion,
        'manufacturer': manufacturer,
        'model': model,
        'androidId': androidId,
      };
}
