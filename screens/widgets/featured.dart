import 'package:flutter/material.dart';
import 'package:food_app/scr/helpers/screen_navigation.dart';
import 'package:food_app/scr/models/products.dart';
import 'package:food_app/scr/screens/details.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

List<ProductModel> productsList = [
];


 class Featured extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Container(
       height: 240,
       child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: productsList.length,
           itemBuilder: (_, index){
             return Padding(padding: EdgeInsets.all(8.0),
               child: GestureDetector(
                 onTap: () {
                   changeScreen(_, Details(product: productsList[index],));
                 },
                 child: Container(
                   height: 240,
                   width: 200,
                   decoration: BoxDecoration(
                       color: white,
                       boxShadow: [
                         BoxShadow(
                           color: grey[300],
                           offset: Offset(15, 5),
                           blurRadius: 30,
                         )
                       ]
                   ),
                   child: Column(
                     children: <Widget> [
                       Image.asset("images/${productsList[index].image}", height: 140, width: 140,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: <Widget> [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: CustomText(
                               text: productsList[index].name,
                               size: 18,
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.all(4),
                             child: Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: white,
                                   boxShadow: [
                                     BoxShadow(
                                       color: grey[300],
                                       offset: Offset(1, 1),
                                       blurRadius: 4,
                                     )
                                   ]
                               ),

                             ),
                           ),
                         ],
                       ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Row(
                             children: <Widget> [
                               Padding(
                                 padding: const EdgeInsets.only(left: 25.0),
                                 child: CustomText(text: productsList[index].rating.toString(), colors: grey, size: 13,),
                               ),
                               SizedBox(width: 2,),
                               Icon(Icons.star, color: red, size: 12,),
                               Icon(Icons.star, color: red, size: 12,),
                               Icon(Icons.star, color: red, size: 12,),
                               Icon(Icons.star, color: red, size: 12,),
                               Icon(Icons.star, color: grey, size: 12,),


                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.only(right: 8.0),
                             child: CustomText(text: "\$${productsList[index].price}", size: 15, weight: FontWeight.bold,),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
               ),
             );
           }
       ),
     );
   }
 }
