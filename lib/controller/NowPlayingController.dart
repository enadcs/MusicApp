import 'package:get/get.dart';
import 'package:music_app/model/SongBean.dart';
import 'package:audioplayers/audioplayers.dart';

import '../view/HomePage.dart';

class NowPlayingController extends GetxController {
  // var songs = <Song>[
  //   Song(
  //       'Song 1',
  //       "Enad",
  //       'https://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3',
  //       'assets/images/song.png'),
  //   Song(
  //       'Song 2',
  //       "Enad 2",
  //       'https://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3',
  //       'assets/images/song.png'),
  //   Song(
  //       'Song 3',
  //       "Enad 3",
  //       'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3',
  //       'assets/images/song.png'),
  // ].obs;
  //
  // var _isPlaying = <bool>[false, false, false].obs;

  final Song song;

  NowPlayingController(this.song);

  bool isPlaying = false ;
  AudioPlayer audioPlayer = AudioPlayer();

  void playOrPause() {
    if (isPlaying) {
      // Pause logic
      isPlaying = false;
      pauseAudio();
    } else {
      // Play logic
      // Here you can add code to play the song using your preferred audio plugin
      isPlaying = true;
      playAudio(song.url);
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
