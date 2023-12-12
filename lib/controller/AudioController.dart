import 'package:get/get.dart';
import 'package:music_app/model/SongBean.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  var songs = <Song>[
    Song(
        'Song 1',
        "Enad",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3',
        'assets/images/song.png'),
    Song(
        'Song 2',
        "Enad 2",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3',
        'assets/images/song.png'),
    Song(
        'Song 3',
        "Enad 3",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3',
        'assets/images/song.png'),
  ].obs;

  var _isPlaying = <bool>[false, false, false].obs;

  bool isPlaying(int index) => _isPlaying[index];
  AudioPlayer audioPlayer = AudioPlayer();

  void playOrPause(int index) {
    if (_isPlaying[index]) {
      // Pause logic
      _isPlaying[index] = false;
      pauseAudio();
    } else {
      // Play logic
      // Here you can add code to play the song using your preferred audio plugin
      _isPlaying[index] = true;
      playAudio(songs[index].url);
    }
    refresh();
  }

  void playAudio(String url) {
    audioPlayer.play(UrlSource(url));

  }

  void pauseAudio() {
    audioPlayer.pause();
  }

}
