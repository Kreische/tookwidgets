import 'dart:io';

mixin DeviceInfoService {
  static Future oncheck() async {
    if (Platform.isAndroid) {}
    if (Platform.isIOS) {}
  }
}
