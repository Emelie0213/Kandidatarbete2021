import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MusicGamePage extends StatefulWidget {
  @override
  _MusicGamePageState createState() => _MusicGamePageState();
}

class _MusicGamePageState extends State<MusicGamePage> {
  AudioCache cache; // = AudioCache();
  AudioPlayer player;
  final test = "Flourlack.wav";

  void _playAll() async {
    await cache.load(test);
    player = await cache.loop(test, volume: 0.0);
  }

  void _stopAll() {
    player?.stop();
  }

  @override
  void initState() {
    super.initState();
    cache = AudioCache();
    //cache.load(test);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          _image(context),
          _backButton(),
          _startButton(),
        ],
      )),
    );
  } //build

  Widget _image(context) {
    return Image(image: AssetImage("assets/Ljudspelet.png"));
  }

  Widget _backButton() {
    return Positioned(
      top: 10,
      child: Transform.rotate(
        angle: 180 * math.pi / 180,
        child: IconButton(
          icon: Icon(Icons.forward),
          iconSize: 50,
          onPressed: () {
            _stopAll();
            Navigator.pop(context);
          },
          color: Color.fromRGBO(42, 132, 210, 1.0),
        ),
      ),
    );
  } //_backButton

  Widget _startButton() {
    return Positioned(
      child: Center(
        child: Container(
          width: 120,
          height: 120,
          child: FloatingActionButton(
              backgroundColor: Color.fromRGBO(42, 132, 210, 1.0),
              shape: StadiumBorder(
                  side: BorderSide(
                color: Colors.blue[900],
                width: 4,
              )),
              child: Text(
                'START',
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                _playAll();
              }),
        ),
      ),
    );
  }

  //_startButton

}
