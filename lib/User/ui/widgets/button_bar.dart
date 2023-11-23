import 'package:advance_flutter_course/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc? userBloc;

  ButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(true, Icons.vpn_key, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(false, Icons.add, 40.0,
                const Color.fromRGBO(255, 255, 255, 1), () => {}),
            CircleButton(
                true,
                Icons.exit_to_app,
                20.0,
                const Color.fromRGBO(255, 255, 255, 0.6),
                () => userBloc?.signOut()),
          ],
        ));
  }

}