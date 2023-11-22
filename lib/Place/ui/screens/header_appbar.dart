import 'package:flutter/material.dart';
import 'package:advance_flutter_course/Place/ui/widgets/card_image_list.dart';
import 'package:advance_flutter_course/widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[GradientBack("Bienvenido", 250.0), CardImageList()],
    );
  }

}