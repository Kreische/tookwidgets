import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  MyAudioPlayer._singleton() {
    audioplayer = AudioPlayer();
  }
  static MyAudioPlayer instance = MyAudioPlayer._singleton();
  late AudioPlayer audioplayer;

  Future play(String string) async {
    try {
      await audioplayer.play(string, isLocal: true, volume: 1);
    } catch (e) {
      return;
    }
  }
}
