import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/scr/helpers/screen_navigation.dart';
import 'package:food_app/scr/providers/category.dart';
import 'package:food_app/scr/providers/user.dart';
import 'package:food_app/scr/screens/bag.dart';
import 'package:food_app/scr/widgets/categories.dart';
import 'package:food_app/scr/widgets/custom_text.dart';
import 'package:food_app/scr/widgets/featured.dart';
import 'package:food_app/scr/widgets/small_button.dart';
import 'package:provider/provider.dart';


import '../helpers/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider> (context);
    final categoryProvider = Provider.of<CategoryProvider> (context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: red,
        iconTheme: IconThemeData(color: white),
        title: CustomText(text: "Food App", size: 25,),
        actions: <Widget>[
          Stack(
            children:<Widget> [
              IconButton(icon: Icon(Icons.shopping_cart),
                  onPressed: (){
                changeScreen(context, ShoppingBag());
                  }),

            ],
          ),

          Stack(
            children:<Widget> [
              IconButton(icon: Icon(Icons.notifications_none), onPressed: (){}),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20)

                  ),
                ),
              )
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: red
              ),
                accountName: CustomText(text: 'User', size: 20, weight: FontWeight.bold),
                accountEmail: CustomText(text: 'Email',size: 15, weight: FontWeight.bold),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: "Home",size: 18, weight: FontWeight.bold,),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.food_bank),
              title: CustomText(text: "Food I Like",size: 18, weight: FontWeight.bold,),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Liked Restaurents",size: 18, weight: FontWeight.bold,),
            ),

            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "My orders",size: 18, weight: FontWeight.bold,),
            ),

            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Settings",size: 18, weight: FontWeight.bold,),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children:<Widget> [
            Container(
              color: red,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8,right: 8,bottom: 16),
              child: Container(
                decoration: BoxDecoration(color: white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    )
                  ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                    hintText: "Find Food or restaurent",
                    border: InputBorder.none
                    ),
                  ),
                  trailing: Icon(Icons.filter_list, color: red,),
                ),

              ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Container(
              height: 5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 140,
                        height: 160,
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(30),
                           child: Image.network(categoryProvider.categories[index].image),
                         ),
                      ),
                    ],
                  ),
                );
              }),
            ),

            SizedBox(
              height: 5,
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Featured", size: 20, colors: grey,
              ),
            ),

            Featured(),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Popular", size: 20, colors: grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                          child: Image.asset("images/7.jpg")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SmallButton(Icons.favorite),
                            ],
                          ),),
                  Padding(
                          padding: const EdgeInsets.only(left:290.9, top:15.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(Icons.star, color: Colors.yellow[900], size: 20,),
                                ),
                                Text("4.5")
                              ],
                            ),
                          ),
                        ),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(0),),
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

                              ],
                            ),

                          ),
                        )
                      ),
                  ),
                  Positioned.fill(child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,8,8,8),
                          child: RichText(text: TextSpan(children: [
                            TextSpan(text: "Pancakes \n", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: white )),
                            TextSpan(text: "by ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: white )),
                            TextSpan(text: "Pizzahut ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: white )),

                          ], style: TextStyle(color: black) ),),

                        ),
                      ],
                    ),
                  ))

                      ],
                    ),
                  ),
                ],
              ),
            ),
      );



  }
}
