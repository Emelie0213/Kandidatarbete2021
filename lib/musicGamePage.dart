import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicGamePage extends StatelessWidget {
  static AudioCache cache = new AudioCache();
  static AudioPlayer player = new AudioPlayer();

  final water = "water.mp3";

  @override
  Widget build(BuildContext context) {
    _playAll();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image(context),
          ],
        ), //Column
      ), //Center
    ); //Scaffold
  }

  void _playAll() async {
    player = await cache.loop(water);
  }

  void _stopAll() {
    player?.stop();
  }

  Widget _image(context) {
    return Stack(
      children: [
        Image(image: AssetImage("assets/MusicGame.PNG")),
        Positioned(
            top: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _stopAll();
                Navigator.pop(context);
              },
              color: Colors.orange,
            )),
        Positioned(
            top: 170,
            left: 180,
            child: IconButton(
              icon: Icon(Icons.music_note_rounded),
              iconSize: 100,
              onPressed: () {},
              color: Colors.orange,
            )),
      ],
    );
  }
} //MainView
