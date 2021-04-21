import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicGamePage extends StatefulWidget {
  @override
  _MusicGamePageState createState() => _MusicGamePageState();
}

class _MusicGamePageState extends State<MusicGamePage> {
  AudioCache cache;
  final test = "Vatten.wav";

  Future _playAll() async {
    await cache.play(test);
    //await cache.load(test);
    cache.loop(test);
  }

  void _stopAll() {
    //player?.stop();
  }

  @override
  void initState() {
    super.initState();
    cache = AudioCache();
    cache.load(test);
  }

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
    return Stack(
      children: [
        Image(image: AssetImage("assets/MusicGame.PNG")),
        Positioned(
            top: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                //_stopAll();
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
              onPressed: () {
                _playAll();
              },
              color: Colors.orange,
            )),
      ],
    );
  } //widget image
}
