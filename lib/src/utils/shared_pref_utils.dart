import 'package:shared_preferences/shared_preferences.dart';
import 'package:tookwidgets/src/models/currency.dart';

mixin CommonPrefKey {
  static const currency = 'currency';
}

mixin CommonSharedPrefUtils {
  static Future<bool?> setCurrency(CurrencyData currency) async {
    final pref = await SharedPreferences.getInstance();
    final res = pref.setString(CommonPrefKey.currency, currency.toJson());
    return res;
  }

  static Future<CurrencyData?> getCurrency() async {
    final pref = await SharedPreferences.getInstance();
    final map = pref.getString(CommonPrefKey.currency);
    if (map == null) return null;
    return CurrencyData.fromJson(map);
  }

  static Future<bool> clear() async {
    final pref = await SharedPreferences.getInstance();
    final res = await pref.clear();
    return res;
  }
}
