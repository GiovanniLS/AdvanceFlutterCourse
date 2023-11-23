import 'package:advance_flutter_course/User/model/user.dart';
import 'package:flutter/material.dart';

class Place {
  String? id;
  String name;
  String description;
  String urlImage;
  int? likes;
  UserLocal? userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      required this.urlImage,
      this.likes,
      this.userOwner});
}