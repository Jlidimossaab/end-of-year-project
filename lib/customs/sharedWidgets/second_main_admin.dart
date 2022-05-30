import 'package:flutter/material.dart' ;
import 'package:pfa_mobile_app/screens_admin/home_admin.dart';
import 'package:pfa_mobile_app/screens_admin/menu_item_form.dart';
import 'package:pfa_mobile_app/screens_admin/menu_modifications.dart';


import '../../screens_admin/director_account.dart';
import '../../screens_admin/profile_body.dart';
import '../sharedElements/AppColors.dart';

class SecondMainAdmin extends StatefulWidget {
  const SecondMainAdmin({ Key? key }) : super(key: key);

  @override
  State<SecondMainAdmin> createState() => _SecondMainAdminState();
}

class _SecondMainAdminState extends State<SecondMainAdmin> {
  int currentIndex=0;
  final screens=[
    const HomeAdmin(),
    const ProfileBody(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index)=>setState(() {
          currentIndex =index;
        }),
        iconSize: 35,
        items:   [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppColors.mainColor,
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
            backgroundColor:AppColors.mainColor,
          ),
        ],
      ),
    );
  }

}