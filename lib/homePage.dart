import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'musicGamePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
        body: Stack(
      children: [
        _background(data),
        _backgroundImage(data),
        _language(),
        _groda(),
        _musicGamePageButton(context),
        _rontgenGameButton(),
        _sugGameButton(),
        _computorButton(),
        _memoryGameButton(),
        _radioButton(),
        _puzzleGameButton(),
      ],
    ));
  }

  Widget _background(data) {
    return Container(
      color: Colors.black,
      height: data.size.height,
      width: data.size.width,
    );
  }

  Widget _backgroundImage(data) {
    return Image(
      height: data.size.height,
      image: AssetImage('assets/HomeMenu.png'),
    );
  }

  Widget _language() {
    return Positioned(
      bottom: 15,
      left: 5,
      child: Image(height: 45, width: 45, image: AssetImage('assets/flag.png')),
    );
  }

  Widget _groda() {
    return Positioned(
      bottom: 12,
      left: 60,
      child:
          Image(height: 50, width: 50, image: AssetImage('assets/groda.png')),
    );
  }

  Widget _musicGamePageButton(context) {
    return Positioned(
      bottom: 140,
      left: 180,
      child: Opacity(
        opacity: 1.0,
        child: Container(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MusicGamePage()));
            },
          ),
        ),
      ),
    );
  }

  Widget _rontgenGameButton() {
    return Positioned(
      bottom: 240,
      left: 255,
      child: Opacity(
        opacity: 1.0,
        child: Container(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _sugGameButton() {
    return Positioned(
      bottom: 185,
      left: 266,
      child: Opacity(
        opacity: 1.0,
        child: Container(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _computorButton() {
    return Positioned(
        bottom: 190,
        left: 16,
        child: TextButton(
          child: Text(
            'Välkommen!\nKlicka runt och \nutforska \nbehandlingsrummet',
            style: GoogleFonts.indieFlower(
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: Color.fromRGBO(42, 132, 210, 1.0),
            ),
          ),
          onPressed: () {},
        ));
  }

  Widget _memoryGameButton() {
    return Positioned(
      bottom: 115,
      left: 295,
      child: Opacity(
        opacity: 1.0,
        child: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _radioButton() {
    return Positioned(
      bottom: 160,
      left: 505,
      child: Opacity(
        opacity: 1.0,
        child: Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _puzzleGameButton() {
    return Positioned(
      bottom: 210,
      left: 420,
      child: Opacity(
        opacity: 1.0,
        child: Container(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
} //MainView
