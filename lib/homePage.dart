import 'package:flutter/material.dart';

import 'musicGamePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    print("$data");
    return Scaffold(
      body: _image(context, data),
    ); //Scaffold
  }

  Widget _image(context, data) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          height: data.size.height,
          width: data.size.width,
        ),
        Image(
          height: data.size.height,
          image: AssetImage("assets/HomeMenu.png"),
        ),
        Positioned(
          bottom: 140,
          left: 180,
          child: Opacity(
            opacity: 0.0,
            child: FlatButton(
              height: 75,
              color: Colors.blue,
              shape: CircleBorder(),
              child: null,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MusicGamePage()));
              },
            ),
          ),
        ),
      ],
    );
  }
} //MainView
