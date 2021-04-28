import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'audio.dart';
import 'imageButton.dart';

class MusicGamePage extends StatefulWidget {
  @override
  _MusicGamePageState createState() => _MusicGamePageState();
}

class _MusicGamePageState extends State<MusicGamePage> {
  List<Audio> audioList;
  bool visibleStartButton = true;
  bool visibleMusicButtons = false;

  bool flourlackPlaying = false;

  @override
  void initState() {
    super.initState();
    //audioList = getAudio();
    //loadAudio(audioList);
  }

  void dispose() {
    super.dispose();
    //stopAudio(audioList);
  }

  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.black,
          height: data.size.height,
          width: data.size.width,
        ),
        _image(context, data),
        _startButton(),
        _backButton(),
        _flourlackButton(data),
      ],
    ));
  } //build

  Widget _image(context, data) {
    if (visibleStartButton == true) {
      return Image(
          image: AssetImage('assets/Musicgame_Background_02.png'),
          height: data.size.height);
    } else {
      return Image(
          image: AssetImage('assets/Musicgame_Background.png'),
          height: data.size.height);
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
                    //playAudio(audioList);
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
            Navigator.pop(context);
          },
          color: Color.fromRGBO(42, 132, 210, 1.0),
        ),
      ),
    );
  } //_backButton

  Widget _flourlackButton(data) {
    print('${data.size.height}');
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: flourlackPlaying,
        whenNotPlaying: ImageButtonInfo(
            filename: 'assets/Images/Flourlack_OFF.png',
            left: data.size.height * 0.98,
            top: data.size.width * 0.34,
            rotation: 55,
            width: 24.28,
            height: 60.78),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Flourlack_ON.png',
          left: data.size.height * 0.98,
          top: data.size.width * 0.34,
          rotation: 55,
          width: 24.28,
          height: 60.78,
        ),
        onPressed: () {
          setState(() {
            flourlackPlaying = !flourlackPlaying;
            print('you pressed flourlack!');
          });
        });
  } //FlourlackButton
} //MusicGamePageState

/* if (_florlackMuted == true) {
      return Positioned(
        top: 200,
        left: 340,
        child: Visibility(
          visible: visibleMusicButtons,
          child: InkWell(
            onTap: () {
              setState(() {
                print("you tapped flourlackButton");
                //audioList.elementAt(0).unmute();
                _florlackMuted = false;
              });
            },
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(55 / 360),
              child: Image(
                image: AssetImage('assets/Images/Flourlack_OFF.png'),
                height: 60.78,
                width: 24.28,
              ),
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        top: 200,
        left: 340,
        child: Visibility(
          visible: visibleMusicButtons,
          child: InkWell(
            onTap: () {
              setState(
                () {
                  print("you tapped flourlackButton");
                  //audioList.elementAt(0).unmute();
                  _florlackMuted = true;
                },
              );
            },
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(55 / 360),
              child: Image(
                image: AssetImage('assets/Images/Flourlack_ON.png'),
                height: 60.78,
                width: 24.28,
              ),
            ),
          ),
        ),
      );
    }
  } //_flourlackButton
}*/
