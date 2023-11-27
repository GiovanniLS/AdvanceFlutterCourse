import 'dart:io';

import 'package:advance_flutter_course/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Place/ui/screens/add_place_screen.dart';
import 'circle_button.dart';

class ButtonsBar extends StatefulWidget {
  UserBloc? userBloc;
  final picker = ImagePicker();

  ButtonsBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ButtonsBar();
  }
}

class _ButtonsBar extends State<ButtonsBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(true, Icons.vpn_key, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(
                false, Icons.add, 40.0, const Color.fromRGBO(255, 255, 255, 1),
                () async {
              final navigator = Navigator.of(context);
              XFile? pickedImage =
                  await widget.picker.pickImage(source: ImageSource.camera);
              if (pickedImage != null) {
                await navigator.push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        AddPlaceScreen(image: File(pickedImage.path))));
              }
            }),
            CircleButton(
                true,
                Icons.exit_to_app,
                20.0,
                const Color.fromRGBO(255, 255, 255, 0.6),
                () => widget.userBloc?.signOut()),
          ],
        ));
  }
}