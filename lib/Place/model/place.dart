import 'package:flutter/material.dart';

class Place {
  String? id;
  String name;
  String description;
  String? urlImage;
  int? likes;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      this.urlImage,
      this.likes});
}
