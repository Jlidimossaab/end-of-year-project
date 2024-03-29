import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfa_mobile_app/customs/sharedElements/AppColors.dart';
import 'package:pfa_mobile_app/services/ticket_service.dart';

import '../../models/ticket.dart';
import '../../services/user_service.dart';
import '../sharedElements/AppIcon.dart';
import '../sharedElements/BigText.dart';
class TicketOptionListTime extends StatelessWidget {
  final int ticketValue ;
  final double ticketPrice ;
  TicketOptionListTime(this.ticketValue, this.ticketPrice, {Key? key}) : super(key: key) ;

  UserService userService = UserService( database: FirebaseFirestore.instance, user: FirebaseAuth.instance.currentUser );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: BigText(text: '$ticketValue Tickets',fontweight: FontWeight.w500,size: 18,),
      trailing: TextButton(onPressed: () {
        manageTickets(ticketValue);
      },
          child: Text('$ticketPrice TDN', ),
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: AppColors.mainColor,
              minimumSize: Size(88, 36),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ))
      ),
    );
  }

  void manageTickets(int value) async{
    TicketService ticketService =  TicketService(userService: userService);
    DocumentSnapshot<Object?> data = await ticketService.getTicket() ;
    if(data.exists){
      await ticketService.updateTicket(value,data);
      print("update complete");
    }
    else{
      Ticket ticket = Ticket(expirationDate: DateTime.now().add(const Duration (days:30) ), purchasedTickets: ticketValue);
      await ticketService.createTicket(ticket);
    }
    Fluttertoast.showToast(msg: "Your purchase is complete") ;
  }
}