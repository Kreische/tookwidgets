import 'package:upgrader/upgrader.dart';

class UpdateAlert {
  UpdateAlert._singleton() {
    upgrader = Upgrader();
  }
  static final UpdateAlert instance = UpdateAlert._singleton();

  late Upgrader upgrader;

  Future checkForUpdate() async {
    final available = upgrader.isUpdateAvailable();
    print('update is available:  + $available');
  }
}
