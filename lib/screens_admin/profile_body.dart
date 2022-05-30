import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfa_mobile_app/models/nutritionist.dart';
import 'package:pfa_mobile_app/screens_admin/settings_director_page.dart';
import 'package:pfa_mobile_app/screens_admin/settings_nutrionist_page.dart';
import 'package:pfa_mobile_app/screens_client/profile/components/SettingsStudent.dart';
import 'package:pfa_mobile_app/screens_client/profile/components/settingsTeacher.dart';
import '../../../customs/sharedElements/BigText.dart';
import '../../../services/user_service.dart';
import '../models/director.dart';
import '../screens_client/profile/components/profile_menu.dart';
import 'director_account.dart';
import 'nutritionist_account.dart';


class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  UserService userService = UserService( database: FirebaseFirestore.instance, user: FirebaseAuth.instance.currentUser );
  dynamic user;
  String userType= "";

  Future <String> getUserType()async{
    String dataType= await userService.getUserType();
    setState(() {
      userType=dataType;
    });
    return dataType;
  }

  Future<void> getUserInformation() async {
    DocumentSnapshot<Object?> data;
    String userType= await userService.getUserType();
    print("usertype=="+userType);
    if(userType =="director"){
      data = await userService.getUserDirector();
      setState(() {
        user = Director.fromMap(data);
      });
    }
    else{
      data = await userService.getUserNutritionist();
      setState(() {
        user = Nutritionist.fromMap(data);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserType();
    getUserInformation();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title: BigText(text: "$userType Profile"),
        ),
        body: SafeArea(
            child:SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ProfileMenu(
                      text: "$userType Account",
                      icon: "assets/icons/User Icon.svg",
                      navigation: userType=="director" ? DirectorAccount(director: user)
                                                       : NutritionistAccount(nutritionist: user)
                  ),
                  ProfileMenu(
                      text: "$userType Settings",
                      icon: "assets/icons/Settings.svg",
                      navigation: userType=="student" ? SettingsStudentPage(student: user, userService: userService)
                          : (userType=="director")
                          ? SettingsDirectorPage(director: user,userService: userService,)
                          : SettingsNutritionistPage(nutritionist: user,userService: userService,)
                  ),
                ],
              ),
            )
        )
    );
  }
}
