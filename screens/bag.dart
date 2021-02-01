import 'package:flutter/material.dart';
import 'package:food_app/scr/helpers/style.dart';
import 'package:food_app/scr/models/products.dart';
import 'package:food_app/scr/widgets/custom_text.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
 // ProductModel product = ProductModel(name: "Chicken", price: 5.99, rating: 4.5, vendor: "GoodFood", wishList: true, image: "salad.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        centerTitle: true,
        title: CustomText(text: "Shopping Bag", size: 20,),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/shopping-bag.png", width: 30, height: 30,),
                ),
                Positioned(
                  right: 9,
                  bottom: 4,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: black,
                                offset: Offset(2,1),
                                blurRadius: 3
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: CustomText(text: "01", colors: red, size: 10, weight: FontWeight.bold,),
                      )),
                ),
              ],
            ),
          )
        ],
        
      ),
      backgroundColor: white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration:BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey,
                    offset: Offset(3,0),
                    blurRadius: 15
                  )

                ]
              ),
              child: Row(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(text: TextSpan(children: [
                       // TextSpan(text: product.name +"\n", style: TextStyle(color: black, fontSize: 20)),
                        //TextSpan(text:"\$"+ product.price.toString(), style: TextStyle(color: black, fontSize: 20), ),
                      ]),),
                      SizedBox(
                        width: 100,
                      ),
                      IconButton(icon: Icon(Icons.delete), onPressed: null)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
