import 'package:advance_flutter_course/User/bloc/bloc_user.dart';
import 'package:advance_flutter_course/platzi_trips_cupertino.dart';
import 'package:advance_flutter_course/widgets/button_green.dart';
import 'package:advance_flutter_course/widgets/gradient_back.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc?.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (userBloc == null || !snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", screenHeight),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const AutoSizeText(
                "Welcome \n This is your Travel App",
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Late",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () {
                  userBloc?.signIn().then((User user) =>
                      print("El usuario es ${user.displayName}"));
                },
                width: 300.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
