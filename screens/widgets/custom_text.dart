// TODO Implement this library.
import 'package:flutter/material.dart';
import 'file:///C:/Users/ankit/AndroidStudioProjects/food_app/lib/scr/helpers/style.dart';
class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color colors;
  final FontWeight weight ;


  CustomText({@required this.text, this.size, this.colors, this.weight,});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size ?? black, fontWeight: weight ?? FontWeight.normal),
    );
  }
}
