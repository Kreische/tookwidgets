import 'package:in_app_update/in_app_update.dart';
import 'package:upgrader/upgrader.dart';

class UpdateAlert {
  UpdateAlert._singleton() {
    _upgrader = Upgrader();
  }
  static final UpdateAlert instance = UpdateAlert._singleton();

  late Upgrader _upgrader;

  Future checkForUpdate() async {
    final available = _upgrader.isUpdateAvailable();
    print('update is available:  + $available');
  }
}
