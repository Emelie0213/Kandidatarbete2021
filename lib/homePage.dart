import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image(),
          ],
        ), //Column
      ), //Center
    ); //Scaffold
  }

  Widget _image() {
    return Stack(
      children: [
        Image(image: AssetImage("assets/HomePage.png")),
        /*Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 101,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            )),*/
      ],
    );
  }
} //MainView
