import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    audioList = getAudioList();
    loadAudio(audioList);
  }

  Future<void> _saveTrack() async {
    return (await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Color.fromRGBO(42, 132, 210, 1.0),
            title: Center(
              child: Text('Spara din låt',
                  style: GoogleFonts.indieFlower(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 2,
                  )),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Låt 1',
                      style: GoogleFonts.indieFlower(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          fontSize: 20,
                          letterSpacing: 2,
                          color: Color.fromRGBO(42, 132, 210, 1.0)),
                    ),
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Låt 2',
                      style: GoogleFonts.indieFlower(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          fontSize: 20,
                          letterSpacing: 2,
                          color: Color.fromRGBO(42, 132, 210, 1.0)),
                    ),
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Låt 3',
                      style: GoogleFonts.indieFlower(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          color: Color.fromRGBO(42, 132, 210, 1.0),
                          fontSize: 20,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
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
        _backgrundImage(context, data),
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
        _recordButton(),
        _backButton(),
      ],
    ));
  } //build

  Widget _backgrundImage(context, data) {
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
                heroTag: Text('startButton'),
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.play_circle_filled_sharp,
                  color: Color.fromRGBO(42, 132, 210, 1.0),
                  size: 120,
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
      top: 15,
      left: 5,
      child: Transform.rotate(
        angle: 180 * math.pi / 180,
        child: FloatingActionButton(
          heroTag: Text('backButton'),
          backgroundColor: Color.fromRGBO(42, 132, 210, 1.0),
          shape: StadiumBorder(
              side: BorderSide(
            color: Colors.white,
            width: 2,
          )),
          child: Icon(
            Icons.forward,
            color: Colors.white,
            size: 50,
          ),
          onPressed: () {
            Navigator.pop(context);
            stopAudio(audioList);
          },
        ),
      ),
    );
  } //_backButton

  Widget _recordButton() {
    return Positioned(
      bottom: 15,
      left: 5,
      child: Visibility(
        visible: visibleMusicButtons,
        child: FloatingActionButton(
          heroTag: Text('recordButton'),
          backgroundColor: Color.fromRGBO(42, 132, 210, 1.0),
          shape: StadiumBorder(
              side: BorderSide(
            color: Colors.white,
            width: 2,
          )),
          child: Icon(
            Icons.star,
            color: Colors.yellow[700],
            size: 50,
          ),
          onPressed: () {
            _saveTrack();
          },
        ),
      ),
    );
  }

  Widget _blasterButton(data) {
    return ImageButtonWidget(
        isVisible: visibleMusicButtons,
        isPlaying: blasterPlaying,
        whenNotPlaying: ImageButtonInfo(
          filename: 'assets/Images/Blaster_OFF.png',
          left: data.size.height * 1.11,
          top: data.size.width * 0.14,
          rotation: 38,
          width: 36,
          height: 100.5,
        ),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Blaster_ON.png',
          left: data.size.height * 1.11,
          top: data.size.width * 0.14,
          rotation: 38,
          width: 36,
          height: 100.5,
        ),
        onPressed: () {
          setState(() {
            blasterPlaying = !blasterPlaying;
            Audio _audio = getAudio('Blaster', audioList);
            blasterPlaying ? _audio.unmute() : _audio.mute();
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
          left: data.size.height * 1.23,
          top: data.size.width * 0.154,
          rotation: 33,
          width: 34.21,
          height: 103,
        ),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Borr_ON.png',
          left: data.size.height * 1.23,
          top: data.size.width * 0.15,
          rotation: 33,
          width: 34.21,
          height: 103,
        ),
        onPressed: () {
          setState(() {
            borrPlaying = !borrPlaying;
            Audio _audio = getAudio('Borr', audioList);
            borrPlaying ? _audio.unmute() : _audio.mute();
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
            left: data.size.height * 1,
            top: data.size.width * 0.3,
            rotation: 55,
            width: 29.37,
            height: 73.44),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Flourlack_ON.png',
          left: data.size.height * 1,
          top: data.size.width * 0.3,
          rotation: 55,
          width: 29.37,
          height: 73.44,
        ),
        onPressed: () {
          setState(() {
            flourlackPlaying = !flourlackPlaying;
            Audio _audio = getAudio('Flourlack', audioList);
            flourlackPlaying ? _audio.unmute() : _audio.mute();
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
          left: data.size.height * 1.35,
          top: data.size.width * 0.159,
          rotation: 26,
          width: 30,
          height: 120,
        ),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Puts_ON.png',
          left: data.size.height * 1.35,
          top: data.size.width * 0.159,
          rotation: 26,
          width: 30,
          height: 120,
        ),
        onPressed: () {
          setState(() {
            putsPlaying = !putsPlaying;
            Audio _audio = getAudio('Puts', audioList);
            putsPlaying ? _audio.unmute() : _audio.mute();
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
            Audio _audio = getAudio('Rontgen', audioList);
            rontgenPlaying ? _audio.unmute() : _audio.mute();
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
            left: data.size.height * 1.35,
            top: data.size.width * 0.36,
            rotation: 48,
            width: 29.88,
            height: 92.8),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Sickel_ON.png',
          left: data.size.height * 1.35,
          top: data.size.width * 0.36,
          rotation: 48,
          width: 29.88,
          height: 92.8,
        ),
        onPressed: () {
          setState(() {
            sickelPlaying = !sickelPlaying;
            Audio _audio = getAudio('Sickel', audioList);
            sickelPlaying ? _audio.unmute() : _audio.mute();
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
            left: data.size.height * 1.15,
            top: data.size.width * 0.32,
            rotation: 49,
            width: 33.55,
            height: 99),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Sond_ON.png',
          left: data.size.height * 1.15,
          top: data.size.width * 0.32,
          rotation: 49,
          width: 33.55,
          height: 99,
        ),
        onPressed: () {
          setState(() {
            sondPlaying = !sondPlaying;
            Audio _audio = getAudio('Sond', audioList);
            sondPlaying ? _audio.unmute() : _audio.mute();
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
            left: data.size.height * 1,
            top: data.size.width * 0.12,
            rotation: 32,
            width: 41.8,
            height: 88.6),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Stol_ON.png',
          left: data.size.height * 1,
          top: data.size.width * 0.12,
          rotation: 32,
          width: 41.8,
          height: 88.6,
        ),
        onPressed: () {
          setState(() {
            stolPlaying = !stolPlaying;
            Audio _audio = getAudio('Stol', audioList);
            stolPlaying ? _audio.unmute() : _audio.mute();
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
            top: data.size.width * 0.31,
            rotation: 0,
            width: 96,
            height: 150),
        whenPlaying: ImageButtonInfo(
          filename: 'assets/Images/Sug_ON.png',
          left: data.size.height * 0.12,
          top: data.size.width * 0.31,
          rotation: 0,
          width: 96,
          height: 150,
        ),
        onPressed: () {
          setState(() {
            sugPlaying = !sugPlaying;
            Audio _audio = getAudio('Sug', audioList);
            sugPlaying ? _audio.unmute() : _audio.mute();
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
          left: data.size.height * 0.48,
          top: data.size.width * 0.2,
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
            Audio _audio = getAudio('Vatten', audioList);
            vattenPlaying ? _audio.unmute() : _audio.mute();
            print('you pressed vatten!');
          });
        });
  } //vattenButton

} //MusicGamePageState
