import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/AudioController.dart';
import 'package:music_app/model/SongBean.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  static Song? currentSongPlaying=null;
  static var audioController = Get.put(AudioController());
  Duration _duration = Duration();
  Duration _position = Duration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('All Songs' , style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        color: Colors.black,
        child: Obx(
              () => ListView.builder(
            itemCount: audioController.songs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(audioController.songs[index].title , style: TextStyle(fontSize: 14 , color: Colors.white),),
                    Text(audioController.songs[index].artist , style: TextStyle(fontSize: 10 , color: Colors.white),),

                  ],
                ),
                leading: IconButton(
                  icon: Obx(() {
                    // Use Obx to update the icon based on _isPlaying state
                    return Icon(audioController.isPlaying(index)
                        ? Icons.pause
                        : Icons.play_arrow , color: Colors.pinkAccent,);
                  }),
                  onPressed: () {
                    audioController.playOrPause(index);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}