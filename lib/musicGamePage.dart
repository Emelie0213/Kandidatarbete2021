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
  bool visibleStartButton = true;
  bool visibleMusicButtons = false;

  void _playAll(double volume) async {
    await cache.load(test);
    player = await cache.loop(test, volume: volume);
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
          _startButton(),
          _backButton(),
          _flourlackButton(),
        ],
      )),
    );
  } //build

  Widget _image(context) {
    return Image(image: AssetImage("assets/Ljudspelet.png"));
  }

  Widget _startButton() {
    return Positioned(
      child: Center(
        child: Container(
          width: 120,
          height: 120,
          child: Visibility(
            visible: visibleStartButton,
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
                  setState(() {
                    _playAll(0.0);
                    visibleStartButton = false;
                    visibleMusicButtons = true;
                  });
                }),
          ),
        ),
      ),
    );
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

  Widget _flourlackButton() {
    return Positioned(
      top: 100,
      right: 10,
      child: Visibility(
        visible: visibleMusicButtons,
        child: IconButton(
          icon: Icon(Icons.music_note),
          onPressed: () {
            _playAll(1.0);
          },
          color: Color.fromRGBO(42, 132, 210, 1.0),
        ),
      ),
    );
  } //_flourlackButton
} //class MusicGamePageState
