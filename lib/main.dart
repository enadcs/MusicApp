import 'package:flutter/material.dart';
import 'package:music_app/view/NowPlayingPage.dart';
import 'package:music_app/view/PodCastPage.dart';
import 'package:music_app/view/SearchPage.dart';
import 'package:music_app/view/SettingsPage.dart';

import 'view/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DarkSearchPage(),
    (Home.currentSongPlaying != null)
        ? NowPlayingPage(Home.currentSongPlaying!)
        : Text("Now Playing"),
    PodCastsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _widgetOptions = <Widget>[
        HomePage(),
        DarkSearchPage(),
        (Home.currentSongPlaying != null)
            ? NowPlayingPage(Home.currentSongPlaying!)
            : Text("Now Playing"),
        PodCastsPage(),
        SettingsPage(),
      ];
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.headphones,
              color: Colors.pinkAccent,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.podcasts),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
