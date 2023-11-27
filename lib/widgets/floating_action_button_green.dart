import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  IconData? iconData;
  VoidCallback? onPressed;

  FloatingActionButtonGreen({super.key, this.iconData, this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  /*void onPressedFav(){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Agregaste a tus Favoritos"),
        )
    );

  }*/

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed ?? () => {},
      heroTag: null,
      child: Icon(widget.iconData),
    );
  }

}