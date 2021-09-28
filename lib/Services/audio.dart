import 'package:just_audio/just_audio.dart';

mixin MyAudioPlayer {
  static Future play(String string) async {
    try {
      final AudioPlayer audioplayer = AudioPlayer();
      await audioplayer.setAsset(string).then((value) => audioplayer.play());
    } catch (e) {
      return;
    }
  }
}
