
import 'package:flutter/material.dart' ;
import 'package:pfa_mobile_app/screens_client/profile/user_profile.dart';
import 'package:pfa_mobile_app/screens_client/userReservations.dart';
import 'buyTickets.dart';
import 'home.dart';

class MainHome extends StatefulWidget {
  const MainHome({ Key? key }) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentIndex=0;
  final screens=[
    Home(),
    BuyTickets(),
    UserReservations(),
    UserProfile(),
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
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor:Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            label: 'Reservation',
            backgroundColor:Colors.blue,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.doorbell_rounded),
            label: 'ticket',
            backgroundColor:Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor:Colors.blue,
          ),
        ],
      ),
    );
  }

}