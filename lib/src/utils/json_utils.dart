import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tookwidgets/src/models/language.dart';

mixin JsonUtils {
  static Future<List<Language>> getLanguageAssetFile() async {
    final jsonString = await rootBundle.loadString('assets/doc/Languages.json');
    final raw = jsonDecode(jsonString);
    final List<Language> list = [];
    for (final item in raw) {
      list.add(Language.fromMap(item));
    }
    return list;
  }
}
