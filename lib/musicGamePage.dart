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
    if (visibleStartButton = true) {
      return Image(image: AssetImage("assets/Musicgame_Background_02.png"));
    } else {
      return Image(image: AssetImage("assets/Musicgame_Background.png"));
    }
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
                    print(
                        "startbutton: $visibleStartButton , musicbuttons: $visibleMusicButtons");
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
      //bottom: 1851,
      left: 86.33,
      child: Visibility(
        visible: visibleMusicButtons,
        child: InkWell(
          onTap: () {
            print("you tapped flourlackButton");
            audioList.elementAt(0).unmute();
          },
          child: Transform.rotate(
            angle: -53,
            child: Image(
              image: AssetImage("assets/Images/Flourlack_OFF.png"),
              height: 60.78,
              width: 24.28,
            ),
          ),
        ),
      ),
    );
  } //_flourlackButton
} //class MusicGamePageState
