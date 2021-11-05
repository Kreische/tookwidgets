import 'package:flutter_config/flutter_config.dart';

mixin ConfigVariable {
  static final googleApiKey = FlutterConfig.get('GOOGLE_API_KEY') as String;
}
