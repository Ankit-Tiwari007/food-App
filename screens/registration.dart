import 'package:flutter/material.dart';
import 'package:food_app/scr/helpers/screen_navigation.dart';
import 'package:food_app/scr/helpers/style.dart';
import 'package:food_app/scr/providers/user.dart';
import 'package:food_app/scr/screens/home.dart';
import 'package:food_app/scr/screens/login.dart';
import 'package:food_app/scr/widgets/custom_text.dart';
import 'package:food_app/scr/widgets/loading.dart';
import 'package:provider/provider.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
        body:authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
          child: Column(
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/lg.png", width: 360, height: 220,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: authProvider.name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: authProvider.email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            icon: Icon(Icons.email)
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: authProvider.password,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            icon: Icon(Icons.lock)
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () async{
                      print("BTN CLICKED!!!!");
                      print("BTN CLICKED!!!!");
                      print("BTN CLICKED!!!!");
                      print("BTN CLICKED!!!!");
                      print("BTN CLICKED!!!!");
                      print("BTN CLICKED!!!!");


                      if(!await authProvider.signUp()) {
                        _key.currentState.showSnackBar(
                            SnackBar(content: Text("Registration failed!"))
                        );
                        return;
                      }
                      authProvider.cleanControllers();
                      changeScreenReplacement(context, Home());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: red,
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(padding: EdgeInsets.only(left: 2, bottom: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomText(text: "Register", colors: Colors.white10, size: 28)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    changeScreen(context, LoginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(text: "Login here", size: 20,),
                    ],
                  ),
                )



              ]
          ),
        )



    );


  }
}
