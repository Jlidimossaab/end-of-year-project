import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfa_mobile_app/customs/sharedElements/AppColors.dart';
import 'package:pfa_mobile_app/customs/sharedElements/BigText.dart';
import 'package:pfa_mobile_app/models/menu_item.dart';
import 'package:pfa_mobile_app/models/reservation.dart';
import 'package:pfa_mobile_app/services/reservation_service.dart';
import 'package:pfa_mobile_app/services/user_service.dart';

import '../customs/sharedElements/IconAndText.dart';
import '../customs/sharedElements/SmallText.dart';

class GetMenuItemForWelcomePage extends StatefulWidget {
  final MenuItem menuItem ;
  GetMenuItemForWelcomePage({required this.menuItem});

  @override
  State<GetMenuItemForWelcomePage> createState() => _GetMenuItemForWelcomePageState();
}

class _GetMenuItemForWelcomePageState extends State<GetMenuItemForWelcomePage> {

  UserService userService = UserService( database: FirebaseFirestore.instance, user: FirebaseAuth.instance.currentUser );
  int partyNumber = 0;

  @override
  void initState() {
    super.initState();
    print(userService.user!.uid);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: widget.menuItem.isLunch ? "Today's Lunch": "Today's Dinner",size: 20,),
        leading:
        IconButton(
          padding: const EdgeInsets.all(2),
          onPressed: (){
            Navigator.pop(context);
          },
          icon :const Icon(Icons.close,size: 25,color: AppColors.textColor,),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 65,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(top:25),
                    height: 230,
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage("${widget.menuItem.imageURL}")  ,
                        )
                    ),
                  ),
                ),
                Positioned(
                    top:300,
                    left:0,
                    right: 0,
                    child: Container(
                      height: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                        ),
                        color: AppColors.backgroundWhite,
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                BigText(text: "${widget.menuItem.title}" ,size: 32,),
                                SmallText(text: "${widget.menuItem.availabilityDate?.day.toString()} / ${widget.menuItem.availabilityDate?.month.toString()} / ${widget.menuItem.availabilityDate?.year.toString()}",size: 16,),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: widget.menuItem.components.length,
                            itemBuilder: (context,index){
                              return IconAndText(icon: Icons.brightness_1, text: widget.menuItem.components[index],size: 20,);
                            },
                          ),
                        ],
                      ),
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}
