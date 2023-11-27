import 'package:advance_flutter_course/User/bloc/bloc_user.dart';
import 'package:advance_flutter_course/User/model/user.dart';
import 'package:advance_flutter_course/platzi_trips_cupertino.dart';
import 'package:advance_flutter_course/widgets/button_green.dart';
import 'package:advance_flutter_course/widgets/gradient_back.dart';
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
  double screenWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
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
          return const PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: SizedBox(
                      width: screenWidth,
                      child: const Text(
                        "Welcome \n This is your Travel App",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: "Late",
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () {
                  userBloc?.signOut();
                  userBloc?.signIn().then((UserCredential userCredential) {
                    User? user = userCredential.user;
                    userBloc?.updateUserData(UserLocal(
                        uid: user?.uid ?? "",
                        name: user?.displayName ?? "",
                        email: user?.email ?? "",
                        photoURL: user?.photoURL ?? ""));
                  });
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
