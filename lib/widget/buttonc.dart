import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class buttonC extends StatelessWidget {
  String op;

  buttonC({required this.op});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: NeumorphicButton(
        child: Text(
          "$op",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
style: NeumorphicStyle(
  surfaceIntensity: 1,
  shape: NeumorphicShape.convex,
  color: Colors.white,
boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
  depth: 8,
shadowDarkColor: Colors.black,
  shadowLightColor: Colors.black,
  shadowDarkColorEmboss: Colors.black,
  shadowLightColorEmboss: Colors.black,

),
      ),
    );

  }
}
