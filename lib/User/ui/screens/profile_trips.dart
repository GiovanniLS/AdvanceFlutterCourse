import 'package:advance_flutter_course/User/ui/screens/profile_header.dart';
import 'package:advance_flutter_course/User/ui/widgets/profile_background.dart';
import 'package:advance_flutter_course/User/ui/widgets/profile_places_list.dart';
import 'package:flutter/material.dart';

class ProfileTrips extends StatelessWidget {
  const ProfileTrips({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()

          ],
        ),
      ],
    );
  }

}