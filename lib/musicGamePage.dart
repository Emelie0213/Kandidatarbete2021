import 'package:flutter/material.dart';

class MusicGamePage extends StatelessWidget {
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
      ],
    );
  }
} //MainView
