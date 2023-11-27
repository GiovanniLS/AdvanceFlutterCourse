import 'package:flutter/material.dart';

import '../../Place/model/place.dart';

class UserLocal {
  final String? uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;

  //myFavoritePlaces
  //myPlaces

  UserLocal(
      {Key? key,
      this.uid,
      required this.name,
      required this.email,
      required this.photoURL,
      this.myPlaces,
      this.myFavoritePlaces});
}
