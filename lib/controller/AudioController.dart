import 'package:get/get.dart';
import 'package:music_app/model/SongBean.dart';
import 'package:audioplayers/audioplayers.dart';

import '../view/HomePage.dart';

class AudioController extends GetxController {
  var songs = <Song>[
    Song(
        'Song 1',
        "Enad 1",
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
    Song(
        'Song 4',
        "Enad 4",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3',
        'assets/images/song.png'),
    Song(
        'Song 5',
        "Enad 5",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3',
        'assets/images/song.png'),
    Song(
        'Song 6',
        "Enad 6",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3',
        'assets/images/song.png'),
    Song(
        'Song 7',
        "Enad 7",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3',
        'assets/images/song.png'),
    Song(
        'Song 8',
        "Enad 8",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3',
        'assets/images/song.png'),
    Song(
        'Song 9',
        "Enad 9",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3',
        'assets/images/song.png'),
    Song(
        'Song 10',
        "Enad 10",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3',
        'assets/images/song.png'),
    Song(
        'Song 11',
        "Enad 11",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3',
        'assets/images/song.png'),
    Song(
        'Song 12',
        "Enad 12",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3',
        'assets/images/song.png'),
    Song(
        'Song 13',
        "Enad 13",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3',
        'assets/images/song.png'),
    Song(
        'Song 14',
        "Enad 14",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3',
        'assets/images/song.png'),
    Song(
        'Song 15',
        "Enad 15",
        'https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3',
        'assets/images/song.png'),
  ].obs;

  var _isPlaying = <bool>[false, false, false,false, false, false,false, false, false,false, false, false,false, false, false].obs;

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
      Home.currentSongPlaying=songs[index];
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
