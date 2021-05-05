import 'package:flutter/material.dart';

class ImageButtonInfo {
  String filename;
  double left;
  double top;
  double rotation;
  double width, height;

  ImageButtonInfo(
      {this.filename,
      this.left,
      this.top,
      this.rotation,
      this.width,
      this.height});
} //ImageButtonInfo

class ImageButtonWidget extends StatelessWidget {
  final bool isVisible;
  final bool isPlaying;
  final ImageButtonInfo whenPlaying;
  final ImageButtonInfo whenNotPlaying;
  final Function onPressed;

  ImageButtonWidget(
      {this.isVisible,
      this.isPlaying,
      this.whenPlaying,
      this.whenNotPlaying,
      this.onPressed});

  Widget build(context) {
    ImageButtonInfo imageInfo = isPlaying ? whenPlaying : whenNotPlaying;

    return Positioned(
      top: imageInfo.top,
      left: imageInfo.left,
      child: Visibility(
        visible: isVisible,
        child: InkWell(
          onTap: () {
            onPressed();
          },
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(imageInfo.rotation / 360),
            child: Image(
              image: AssetImage(imageInfo.filename),
              height: imageInfo.height,
              width: imageInfo.width,
            ),
          ),
        ),
      ),
    );
  } //Widget build
} //ImageButtionWidget
