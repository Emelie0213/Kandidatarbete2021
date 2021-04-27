import 'package:flutter/material.dart';

class AudioButton extends StatefulWidget {
  @override
  _AudioButtonState createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200,
      left: 340,
      child: Visibility(
        visible: true,
        child: InkWell(
          onTap: () {
            print('you tapped flourlackButton');
            //audioList.elementAt(0).unmute();
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
  }
}
