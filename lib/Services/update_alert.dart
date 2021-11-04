import 'package:in_app_update/in_app_update.dart';

class UpdateAlert {
  UpdateAlert._singleton() {
    inAppUpdate = InAppUpdate();
  }

  static final UpdateAlert instance = UpdateAlert._singleton();

  InAppUpdate inAppUpdate = InAppUpdate();

  Future checkForUpdate() async {
    final updateInfo = await InAppUpdate.checkForUpdate();
  }
}
