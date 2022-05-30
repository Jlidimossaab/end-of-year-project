import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfa_mobile_app/customs/sharedElements/AppColors.dart';
import 'package:pfa_mobile_app/customs/sharedElements/BigText.dart';
import 'package:pfa_mobile_app/customs/sharedElements/IconAndText.dart';
import 'package:pfa_mobile_app/customs/sharedElements/SmallText.dart';
import 'package:pfa_mobile_app/screens_client/getMenuItem.dart';
import 'package:pfa_mobile_app/screens_client/logIn.dart';
import 'package:pfa_mobile_app/screens_client/menu_item_body_welcome_page.dart';
import 'package:pfa_mobile_app/screens_client/menu_item_welcome_page.dart';
import 'package:pfa_mobile_app/screens_client/signUpOptions.dart';

import '../models/menu_item.dart';
import '../services/menu_item_service.dart';
import '../services/user_service.dart';
class Welcome extends StatefulWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  //Dynamic Code
  UserService userService = UserService(database: FirebaseFirestore.instance,
      user: FirebaseAuth.instance.currentUser);

  //final ref = FirebaseStorage.instance ;
  List<MenuItem> _menuItemForToday = [];


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getMenuItemsByDate();
  }

  Future<void> getMenuItemsByDate() async {
    MenuItemService menuItemService = MenuItemService(userService: userService);
    QuerySnapshot<Object?> data = await menuItemService.getMenuItemByDate();
    if (data.docs.isNotEmpty) {
      setState(() {
        _menuItemForToday = List.from(
            data.docs.map((documentQuery) =>
                MenuItem.fromMap(documentQuery)
            )
        );
        print(_menuItemForToday);
      });
      print(_menuItemForToday);
    } else {
      print("no available menu items for this date");
    }
  }

  // Variables
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;

  double scaleFactor = 0.8;

  double _height = 220;

  // method inside any stateful widget, to use you must override
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        // recuperate current page value
        _currentPageValue = pageController.page!;
      });
    });
  }

  // dispose liberates memories
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child:Text("Welcome to our app", style : TextStyle(color: HexColor("#697A98"), fontWeight: FontWeight.bold)),)
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: SizedBox(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 50,),
                      const Text(" Here's our meal for today ", style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),),
                      const MenuItemBodyForWelcomePage(),
                      const Text(" Please log in to make the booking ", style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),),
                      Center(
                        child:Column(
                          children: <Widget>[
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: 250.0,
                              height: 50.0,
                              child: FlatButton(
                                minWidth: 210,
                                color: Colors.blue,
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => const LogIn() ));
                                },
                                child: const Text(
                                  "Log in", style: TextStyle(
                                  fontSize: 16, letterSpacing: 2.2, color: Colors.black,
                                ),),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: 250.0,
                              height: 50.0,
                              child: FlatButton(
                                minWidth: 210,
                                color: Colors.green,
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => const SignUpOptions() ));
                                },
                                child: const Text(
                                  " Sign in", style: TextStyle(
                                  fontSize: 16, letterSpacing: 2.2, color: Colors.black,
                                ),),
                              ),
                            ),
                          ],
                        )

                      ),
                    ],
                  )
              )
          )
      ),
    );
  }
}
