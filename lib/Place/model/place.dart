import 'package:flutter/material.dart';

import '../../User/model/user.dart';

class Place {
  String? id;
  String name;
  String description;
  String? urlImage;
  int? likes;
  UserLocal? userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      this.urlImage,
      this.likes,
      this.userOwner});
}
