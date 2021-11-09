import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:tookwidgets/Models/DeviceInfo.dart';

mixin DeviceInfoService {
  static Future get() async {
    final infoService = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await infoService.androidInfo;
      final data = DeviceInfo.android(info);
      print(data.toMap);
    }
    if (Platform.isIOS) {
      final info = await infoService.iosInfo;
      final data = DeviceInfo.ios(info);
      print(data.toMap);
    }
  }
}
