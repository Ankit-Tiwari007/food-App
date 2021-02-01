import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/scr/helpers/style.dart';


import 'package:food_app/scr/models/products.dart';
import 'package:food_app/scr/widgets/custom_text.dart';

class Details extends StatefulWidget {
  final ProductModel product;


  Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Carousel(
                  images: [
                    AssetImage('images/${widget.product.image}'),
                    AssetImage('images/${widget.product.image}'),
                    AssetImage('images/${widget.product.image}'),
                  ],
                  dotSize: 5,
                  dotIncreaseSize: 1,
          autoplay: false,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: black,),
                        onPressed: () {Navigator.pop(context);},
                      ),
                        Stack(
                          children: <Widget>[
                            Padding(
                                 padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                   children: <Widget>[
                                      Image.asset("images/shopping-bag.png", width: 30, height: 30,),


                                        ],
                                        ),
                                        ),
                            Positioned(
                              right: 9,
                              bottom: 4,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: grey,
                                            offset: Offset(2,1),
                                            blurRadius: 3
                                        )
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: CustomText(text: "2", colors: red, size: 10, weight: FontWeight.bold,),
                                  )),
                            ),
                          ],
                        ),
                    ],
                ),
                 Positioned(
                   right: 10,
                   bottom: 10,
                   child: Container(
                     decoration: BoxDecoration(
                       color: white,
                       borderRadius: BorderRadius.circular(20),
                       boxShadow: [
                         BoxShadow(
                           color: grey,
                           offset: Offset(2,3),
                           blurRadius: 3
                         )
                       ]
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: Icon(
                         Icons.favorite,
                         size: 22,
                         color: red,
                       ),
                     ),
                 )
                 )],
            ),
          ),
            SizedBox(
              height: 15,
            ),
            CustomText(text: widget.product.name, size: 20, weight: FontWeight.bold,),
            CustomText(text:"\$"+ widget.product.price.toString(), size: 14, weight: FontWeight.w600,),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove,), onPressed: (){}),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: CustomText(text: "Add To Bag", size: 20,colors: Colors.blueGrey, weight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add, color: red,), onPressed: (){}),
                ),
              ],
            )
              ],
          ),
          ),
        );
       }
     }