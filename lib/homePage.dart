import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'musicGamePage.dart';

class HomePage extends StatelessWidget {
  Future<void> _showDialog(context, title, message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text('$title',
                style: GoogleFonts.indieFlower(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 2)),
          ),
          backgroundColor: Color.fromRGBO(42, 132, 210, 1.0),
          content: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                    child: Text(
                      '$message',
                      style: GoogleFonts.indieFlower(
                          height: 1.2,
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2),
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: GoogleFonts.indieFlower(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
        body: Stack(
      children: [
        _background(data),
        _backgroundImage(data),
        _language(context),
        _frog(context),
        _musicGamePageButton(context),
        _rontgenGameButton(context),
        _sugGameButton(context),
        _computorButton(context),
        _memoryGameButton(context),
        _hideAndSeekButton(context),
        _radioButton(context),
        _puzzleGameButton(context),
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
      image: AssetImage('assets/HomeMenu01.png'),
    );
  }

  Widget _language(context) {
    String title = 'Språk';
    String message = 'Välj vilket språk appen ska använda.';

    return Positioned(
      bottom: 15,
      left: 5,
      child: InkWell(
        child: Image(
          height: 45,
          width: 45,
          image: AssetImage('assets/flag.png'),
        ),
        onTap: () {
          _showDialog(context, title, message);
        },
      ),
    );
  }

  Widget _frog(context) {
    String title = 'Belöningssystem';
    String message =
        'Samla grodor i olika färger genom \natt spela de olika spelen.';

    return Positioned(
      bottom: 12,
      left: 60,
      child: InkWell(
        child:
            Image(height: 50, width: 50, image: AssetImage('assets/groda.png')),
        onTap: () {
          _showDialog(context, title, message);
        },
      ),
    );
  }

  Widget _musicGamePageButton(context) {
    return Positioned(
      bottom: 140,
      left: 180,
      child: Opacity(
        opacity: 0.0,
        child: Container(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            heroTag: Text('musicGamePage'),
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

  Widget _rontgenGameButton(context) {
    String title = 'Röntgenspel';
    String message = 'Ta röntgenbilder genom att matcha \nkameran med tanden.';

    return Positioned(
      bottom: 240,
      left: 255,
      child: Opacity(
        opacity: 0.0,
        child: Container(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            heroTag: Text('rontgenGameButton'),
            shape: CircleBorder(),
            onPressed: () {
              _showDialog(context, title, message);
            },
          ),
        ),
      ),
    );
  }

  Widget _sugGameButton(context) {
    String title = 'Sugspel';
    String message =
        'Vattenfontänen börjar läcka och \nbehandligsrummet fylls med vatten. \n\nAnvänd sugen för att suga upp \nallt vatten.';

    return Positioned(
      bottom: 185,
      left: 266,
      child: Opacity(
        opacity: 0.0,
        child: Container(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            heroTag: Text('sugGameButton'),
            shape: CircleBorder(),
            onPressed: () {
              _showDialog(context, title, message);
            },
          ),
        ),
      ),
    );
  }

  Widget _computorButton(context) {
    String title = 'Information för vuxna';
    String message =
        'En lista med paket av minispel för olika \nbehandlingar; undersökning, lagning osv. \n\nFöre varje spel får föräldern förslag på \ndiskussionsämnen att ta upp med sitt barn; \nhur det kan låta, kännas osv.';

    return Positioned(
        bottom: 193,
        left: 13,
        child: Card(
          color: Color.fromRGBO(42, 132, 210, 1.0),
          child: TextButton(
            child: Text(
              'Välkommen!\nKlicka runt och \nutforska \nbehandlingsrummet',
              style: GoogleFonts.indieFlower(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  color: Colors.white,
                  letterSpacing: 0.9,
                  fontSize: 12),
            ),
            onPressed: () {
              _showDialog(context, title, message);
            },
          ),
        ));
  }

  Widget _memoryGameButton(context) {
    String title = 'Memory';
    String message =
        'Spela memory med olika verktyg och \nsaker som finns i behandlingsrummet. \nReglera svårighetsgraden.';

    return Positioned(
      bottom: 150,
      left: 345,
      child: Opacity(
        opacity: 0.0,
        child: Container(
          height: 55,
          width: 55,
          child: FloatingActionButton(
            heroTag: Text('memoryGameButton'),
            shape: CircleBorder(),
            onPressed: () {
              _showDialog(context, title, message);
            },
          ),
        ),
      ),
    );
  }

  Widget _hideAndSeekButton(context) {
    String title = 'Hitta Verktygen';
    String message =
        'Hitta vektygen som gömt sig på \nolika ställen i behandlingsrummet.';

    return Positioned(
      bottom: 115,
      left: 295,
      child: Opacity(
        opacity: 0.0,
        child: Container(
          height: 55,
          width: 55,
          child: FloatingActionButton(
            heroTag: Text('hideAndSeekButton'),
            shape: CircleBorder(),
            onPressed: () {
              _showDialog(context, title, message);
            },
          ),
        ),
      ),
    );
  }

  Widget _radioButton(context) {
    String title = 'Radion';
    String message = 'Spela upp låtarna som du \ngjort i musikspelet.';

    return Positioned(
      bottom: 160,
      left: 505,
      child: Opacity(
        opacity: 0.0,
        child: Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            heroTag: Text('radioButton'),
            shape: CircleBorder(),
            onPressed: () {
              _showDialog(context, title, message);
            },
          ),
        ),
      ),
    );
  }

  Widget _puzzleGameButton(context) {
    String title = 'Pussel';
    String message =
        'Välj mellan två sorters pussel \noch svårighetsgrad. Bygg ihop \nbilder på de olika verktygen.';

    return Positioned(
      bottom: 210,
      left: 420,
      child: Opacity(
        opacity: 0.0,
        child: Container(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            heroTag: Text('puzzleGameButton'),
            shape: CircleBorder(),
            onPressed: () {
              _showDialog(context, title, message);
            },
          ),
        ),
      ),
    );
  }
} //MainView
