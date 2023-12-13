import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/NowPlayingController.dart';
import 'package:music_app/model/SongBean.dart';

class NowPlayingPage extends StatefulWidget {
  Song currentSong;

  NowPlayingPage(this.currentSong);

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  NowPlayingController? audioController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioController = Get.put(NowPlayingController(widget.currentSong));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      appBar: AppBar(
        title: Text('Now Playing'),
        backgroundColor: Colors.black, // App bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Thumbnail image (replace with your image widget or network image)
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(widget.currentSong.thumbImage),
                  // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Name of the song
            Text(
              widget.currentSong.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.currentSong.artist,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            // Play/Pause button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon:
                      // Use Obx to update the icon based on _isPlaying state
                      Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: 20,),
                IconButton(
                  icon:
                      // Use Obx to update the icon based on _isPlaying state
                      Icon(
                    audioController!.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.pinkAccent,
                    size: 50,
                  ),
                  onPressed: () {
                    audioController!.playOrPause();
                    setState(() {});
                  },
                ),
                SizedBox(width: 20,),
                IconButton(
                  icon:
                  // Use Obx to update the icon based on _isPlaying state
                  Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),

              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
