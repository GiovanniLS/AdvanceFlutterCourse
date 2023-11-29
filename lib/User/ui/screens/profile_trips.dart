import 'package:advance_flutter_course/User/bloc/bloc_user.dart';
import 'package:advance_flutter_course/User/model/user.dart';
import 'package:advance_flutter_course/User/ui/screens/profile_header.dart';
import 'package:advance_flutter_course/User/ui/widgets/profile_places_list.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc? userBloc;

  ProfileTrips({super.key});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return StreamBuilder(
        stream: userBloc?.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.none:
              return const CircularProgressIndicator();
            case ConnectionState.active:
              return showProfileData(snapshot);
            case ConnectionState.done:
              return showProfileData(snapshot);
          }
        });

    /*Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[ProfileHeader(), ProfilePlacesList()],
        ),
      ],
    );*/
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      debugPrint("No logeado");
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: const <Widget>[Text("Usuario no logeado. Haz login")],
          ),
        ],
      );
    } else {
      debugPrint("Logeado");
      var data = snapshot.data;
      var user = UserLocal(
          uid: data.uid,
          name: data.displayName,
          email: data.email,
          photoURL: data.photoURL);
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user: user),
              ProfilePlacesList(user: user)
            ],
          ),
        ],
      );
    }
  }
}