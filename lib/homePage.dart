import 'package:flutter/material.dart';

import 'musicGamePage.dart';

class HomePage extends StatelessWidget {
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
        Image(image: AssetImage("assets/HomePage.png")),
        Positioned(
            bottom: 130,
            left: 170,
            // right: 0,
            child: Visibility(
              child: FlatButton(
                child: null,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MusicGamePage()));
                },
                shape: new CircleBorder(),
                color: Colors.black12,
              ),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: true,
            )),
      ],
    );
  }
} //MainView
