import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class MusicGamePage extends StatelessWidget {
  static AudioCache player = new AudioCache();

  @override
  Widget build(BuildContext context) {
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

  Widget _image(context) {
    const water = "water.mp3";

    return Stack(
      children: [
        Image(image: AssetImage("assets/MusicGame.PNG")),
        Positioned(
            top: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.orange,
            )),
        Positioned(
            top: 50,
            child: IconButton(
              icon: Icon(Icons.note),
              onPressed: () {
                player.play(water);
              },
              color: Colors.orange,
            )),
      ],
    );
  }
} //MainView
