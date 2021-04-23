import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'audio.dart';

class MusicGamePage extends StatefulWidget {
  @override
  _MusicGamePageState createState() => _MusicGamePageState();
}

class _MusicGamePageState extends State<MusicGamePage> {
  List<Audio> audioList;
  bool visibleStartButton = true;
  bool visibleMusicButtons = false;

  @override
  void initState() {
    super.initState();
    audioList = getAudio();
    loadAudio(audioList);
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
                    playAudio(audioList);
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
            stopAudio(audioList);
            Navigator.pop(context);
          },
          color: Color.fromRGBO(42, 132, 210, 1.0),
        ),
      ),
    );
  } //_backButton

  Widget _flourlackButton() {
    return Positioned(
      bottom: 100,
      right: 240,
      child: Visibility(
        visible: visibleMusicButtons,
        child: InkWell(
          onTap: () {
            print("you tapped flourlackButton");
            audioList.elementAt(0).mute();
          },
          child: Transform.rotate(
            angle: math.pi / 4,
            child: Image(
              image: AssetImage("assets/placeholderMuted.png"),
              height: 50,
              width: 25,
            ),
          ),
        ),
      ),
    );
  } //_flourlackButton
} //class MusicGamePageState
