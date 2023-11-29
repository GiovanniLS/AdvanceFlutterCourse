import 'package:advance_flutter_course/User/ui/widgets/button_bar.dart';
import 'package:advance_flutter_course/User/ui/widgets/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';

class ProfileHeader extends StatelessWidget {
  UserLocal? user;

  ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    const title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: <Widget>[
          const Row(
            children: <Widget>[title],
          ),
          UserInfoLocal(user),
          ButtonsBar()
        ],
      ),
    );
  }

  Widget showProfileData(AsyncSnapshot<User?> snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      debugPrint("No logeado");
      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: const Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la información. Haz login")
          ],
        ),
      );
    } else {
      debugPrint("Logeado");
      debugPrint(snapshot.data?.toString() ?? "");
      user = UserLocal(
          name: snapshot.data?.displayName ?? "",
          email: snapshot.data?.email ?? "",
          photoURL: snapshot.data?.photoURL ?? "");
      const title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            const Row(
              children: <Widget>[title],
            ),
            UserInfoLocal(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}