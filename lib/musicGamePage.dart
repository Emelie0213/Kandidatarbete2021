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

  bool blasterPlaying = false;
  bool borrPlaying = false;
  bool flourlackPlaying = false;
  bool putsPlaying = false;
  bool rontgenPlaying = false;
  bool sickelPlaying = false;
  bool sondPlaying = false;
  bool stolPlaying = false;
  bool sugPlaying = false;
  bool vattenPlaying = false;

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
        _blasterButton(data),
        _borrButton(data),
        _flourlackButton(data),
        _putsButton(data),
        _rontgenButton(data),
        _sickelButton(data),
        _sondButton(data),
        _stolButton(data),
        _sugButton(data),
        _vattenButton(data),
        _backButton(),
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

  Widget _blasterButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: blasterPlaying,
        whenNotPlaying: ImageButtonInfo(
          filename: 'assets/Images/Blaster_OFF.png',
          left: data.size.height * 1.02,
          top: data.size.width * 0.17,
          rotation: 38,
          width: 36,
          height: 100.5,
        ),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Blaster_ON.png',
          left: data.size.height * 1.02,
          top: data.size.width * 0.17,
          rotation: 38,
          width: 36,
          height: 100.5,
        ),
        onPressed: () {
          setState(() {
            blasterPlaying = !blasterPlaying;
            print('you pressed blaster!');
          });
        });
  } //blasterButton

  Widget _borrButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: borrPlaying,
        whenNotPlaying: ImageButtonInfo(
          filename: 'assets/Images/Borr_OFF.png',
          left: data.size.height * 1.13,
          top: data.size.width * 0.185,
          rotation: 36,
          width: 31.1,
          height: 94,
        ),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Borr_ON.png',
          left: data.size.height * 1.13,
          top: data.size.width * 0.185,
          rotation: 36,
          width: 31.1,
          height: 94,
        ),
        onPressed: () {
          setState(() {
            borrPlaying = !borrPlaying;
            print('you pressed borr!');
          });
        });
  } //borrButton

  Widget _flourlackButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: flourlackPlaying,
        whenNotPlaying: ImageButtonInfo(
            filename: 'assets/Images/Flourlack_OFF.png',
            left: data.size.height * 0.95,
            top: data.size.width * 0.34,
            rotation: 55,
            width: 29.37,
            height: 73.44),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Flourlack_ON.png',
          left: data.size.height * 0.95,
          top: data.size.width * 0.34,
          rotation: 55,
          width: 29.37,
          height: 73.44,
        ),
        onPressed: () {
          setState(() {
            flourlackPlaying = !flourlackPlaying;
            print('you pressed flourlack!');
          });
        });
  } //FlourlackButton

  Widget _putsButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: putsPlaying,
        whenNotPlaying: ImageButtonInfo(
          filename: 'assets/Images/Puts_OFF.png',
          left: data.size.height * 1.24,
          top: data.size.width * 0.21,
          rotation: 34,
          width: 27,
          height: 92,
        ),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Puts_ON.png',
          left: data.size.height * 1.24,
          top: data.size.width * 0.21,
          rotation: 34,
          width: 27,
          height: 92,
        ),
        onPressed: () {
          setState(() {
            putsPlaying = !putsPlaying;
            print('you pressed borr!');
          });
        });
  } //putsButton

  Widget _rontgenButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: rontgenPlaying,
        whenNotPlaying: ImageButtonInfo(
            filename: 'assets/Images/Rontgen_OFF.png',
            left: data.size.height * -0.04,
            top: data.size.width * 0.016,
            rotation: 0,
            width: 224,
            height: 138),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Rontgen_ON.png',
          left: data.size.height * -0.04,
          top: data.size.width * 0.016,
          rotation: 0,
          width: 224,
          height: 138,
        ),
        onPressed: () {
          setState(() {
            rontgenPlaying = !rontgenPlaying;
            print('you pressed rontgen!');
          });
        });
  } //rontgenButton

  Widget _sickelButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: sickelPlaying,
        whenNotPlaying: ImageButtonInfo(
            filename: 'assets/Images/Sickel_OFF.png',
            left: data.size.height * 1.26,
            top: data.size.width * 0.41,
            rotation: 48,
            width: 29.88,
            height: 92.8),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Sickel_ON.png',
          left: data.size.height * 1.26,
          top: data.size.width * 0.41,
          rotation: 48,
          width: 29.88,
          height: 92.8,
        ),
        onPressed: () {
          setState(() {
            sickelPlaying = !sickelPlaying;
            print('you pressed sickel!');
          });
        });
  } //sickelButton

  Widget _sondButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: sondPlaying,
        whenNotPlaying: ImageButtonInfo(
            filename: 'assets/Images/Sond_OFF.png',
            left: data.size.height * 1.095,
            top: data.size.width * 0.362,
            rotation: 49,
            width: 33.55,
            height: 99),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Sond_ON.png',
          left: data.size.height * 1.095,
          top: data.size.width * 0.362,
          rotation: 49,
          width: 33.55,
          height: 99,
        ),
        onPressed: () {
          setState(() {
            sondPlaying = !sondPlaying;
            print('you pressed sond!');
          });
        });
  } //sondButton

  Widget _stolButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: stolPlaying,
        whenNotPlaying: ImageButtonInfo(
            filename: 'assets/Images/Stol_OFF.png',
            left: data.size.height * 0.92,
            top: data.size.width * 0.130,
            rotation: 32,
            width: 41.8,
            height: 88.6),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Stol_ON.png',
          left: data.size.height * 0.92,
          top: data.size.width * 0.130,
          rotation: 32,
          width: 41.8,
          height: 88.6,
        ),
        onPressed: () {
          setState(() {
            stolPlaying = !stolPlaying;
            print('you pressed stol!');
          });
        });
  } //stolButton

  Widget _sugButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: sugPlaying,
        whenNotPlaying: ImageButtonInfo(
            filename: 'assets/Images/Sug_OFF.png',
            left: data.size.height * 0.12,
            top: data.size.width * 0.34,
            rotation: 0,
            width: 96,
            height: 150),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Sug_ON.png',
          left: data.size.height * 0.12,
          top: data.size.width * 0.34,
          rotation: 0,
          width: 96,
          height: 150,
        ),
        onPressed: () {
          setState(() {
            sugPlaying = !sugPlaying;
            print('you pressed sug!');
          });
        });
  } //sugButton

  Widget _vattenButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: vattenPlaying,
        whenNotPlaying: ImageButtonInfo(
          filename: 'assets/Images/Vatten_OFF.png',
          left: data.size.height * 0.45,
          top: data.size.width * 0.24,
          rotation: 3,
          width: 126.47,
          height: 130,
        ),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Vatten_ON.png',
          left: data.size.height * 0.45,
          top: data.size.width * 0.24,
          rotation: 3,
          width: 126.47,
          height: 130,
        ),
        onPressed: () {
          setState(() {
            vattenPlaying = !vattenPlaying;
            print('you pressed vatten!');
          });
        });
  } //vattenButton
} //MusicGamePageState
