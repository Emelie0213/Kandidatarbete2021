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
        Image(image: AssetImage("assets/HomeMenu.png")),
        Positioned(
            bottom: 130,
            left: 170,
            child: Visibility(
              child: FlatButton(
                color: Colors.blue,
                shape: CircleBorder(),
                child: null,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MusicGamePage()));
                },
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
