import 'package:just_audio/just_audio.dart';

class MyAudioPlayer {
  MyAudioPlayer._singleton() {
    audioplayer = AudioPlayer();
  }
  static MyAudioPlayer instance = MyAudioPlayer._singleton();
  late AudioPlayer audioplayer;

  Future play(String string) async {
    try {
      await audioplayer.setAsset(string).then((value) => audioplayer.play());
    } catch (e) {
      return;
    }
  }
}
