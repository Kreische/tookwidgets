import 'package:just_audio/just_audio.dart';

class MyAudioPlayer {
  MyAudioPlayer._singleton() {
    audioplayer = AudioPlayer();
  }
  static MyAudioPlayer instance = MyAudioPlayer._singleton();
  late AudioPlayer audioplayer;

  Future play(String string) async {
    try {
      final AudioPlayer thisPlayer = AudioPlayer();
      await thisPlayer.setVolume(1);
      await thisPlayer.setAsset(string).then((v) => thisPlayer.play());
    } catch (e) {
      return;
    }
  }

  Future playOfferAcceptedRing(String path) async {
    try {
      if (audioplayer.playing) {
        await audioplayer.stop();
      }
      await Future.wait([
        audioplayer.setVolume(1),
        audioplayer.setLoopMode(LoopMode.one),
      ]);
      await audioplayer.setAsset(path).then((v) => audioplayer.play());
    } catch (e) {
      return;
    }
  }

  Future stop() async {
    if (!audioplayer.playing) return;
    await audioplayer.stop();
  }
}
