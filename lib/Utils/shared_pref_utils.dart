import 'package:shared_preferences/shared_preferences.dart';

mixin CommonPrefKey {}

mixin CommonSharedPrefUtils {
  static Future<bool> clear() async {
    final pref = await SharedPreferences.getInstance();
    final res = await pref.clear();
    return res;
  }
}
