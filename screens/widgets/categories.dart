import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/scr/models/category.dart';
import '../helpers/style.dart';
import 'custom_text.dart';


class Category extends StatelessWidget {
  final CategoryModel category;

  const Category ({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Stack(
        children: <Widget>[
          Container(
            width: 140,
            height: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(category.image)),
            ),
          Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(0),
             ),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                  Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.05),
              Colors.black.withOpacity(0.025),
          ]
              )),
          ),
      Positioned.fill(
    child: Align(
      alignment: Alignment.center,
      child: CustomText(text: category.name, size: 26, weight: FontWeight.w300,)))
        ],
    ),
    );
  }
}