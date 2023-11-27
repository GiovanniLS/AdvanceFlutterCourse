import 'dart:io';

import 'package:advance_flutter_course/widgets/floating_action_button_green.dart';
import 'package:flutter/material.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double? width;
  double? left;
  final String pathImage;
  VoidCallback? onPressedFabIcon = () {};
  final IconData iconData;
  DecorationImage? decorationImage;

  CardImageWithFabIcon(
      {super.key,
      required this.pathImage,
      required this.width,
      required this.height,
      this.onPressedFabIcon,
      required this.iconData,
      this.left});

  @override
  Widget build(BuildContext context) {
    if (pathImage.contains("assets")) {
      decorationImage =
          DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage));
    } else {
      debugPrint("Este es el image path file $pathImage");
      decorationImage =
          DecorationImage(fit: BoxFit.cover, image: FileImage(File(pathImage)));
    }
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left: left ?? 0.0),
      decoration: BoxDecoration(
          image: decorationImage,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
            iconData: iconData, onPressed: onPressedFabIcon)
      ],
    );
  }

}