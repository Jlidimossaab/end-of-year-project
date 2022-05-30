import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pfa_mobile_app/screens_client/profile/components/SettingsStudent.dart';
import 'package:pfa_mobile_app/screens_client/profile/components/settingsTeacher.dart';
import 'package:pfa_mobile_app/screens_client/profile/components/staff_admin_account.dart';
import 'package:pfa_mobile_app/screens_client/profile/components/teacher_account_page.dart';
import 'package:pfa_mobile_app/services/ticket_service.dart';
import '../../../customs/sharedElements/AppColors.dart';
import '../../../customs/sharedElements/BigText.dart';
import '../../../models/staff.dart';
import '../../../models/student.dart';
import '../../../models/teacher.dart';
import '../../../models/ticket.dart';
import '../../../services/user_service.dart';
import '../../userReservations.dart';
import 'SettingsStaff.dart';
import 'student_account.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    if(userType =="teacher"){
      data = await userService.getUserTeacher();
      setState(() {
        user = Teacher.fromMap(data);
      });
    }
    else if(userType =="student"){
      data = await userService.getUserStudent();
      setState(() {
        user = Student.fromMap(data);
      });
    }else if (userType=="staff"){
      data = await userService.getUserStaff();
      if(data.exists){
        setState(() {
          user = Staff.fromMap(data);
        });
      }else{
        print("data staff not found");
      }
    }
  }

  Ticket? ticket;

  Future<void> getUserTicket() async {
    TicketService ticketService = TicketService(userService: userService);
    DocumentSnapshot<Object?> data = await ticketService.getTicket();
    setState(() {
      ticket = Ticket.fromMap(data);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserTicket();
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
            title: BigText(text: "Profile"),
            leading: IconButton(icon: const Icon(Icons.segment),
                color : AppColors.textColor,
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const UserReservations() ));
                }
            )
        ),
      body: SafeArea(
          child:SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const ProfilePic(),
                    Column(
                      children: [
                        IconButton(
                            iconSize: 60,
                            icon: SvgPicture.asset(
                              "assets/icons/ticketIcon.svg",
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Body()),
                              );
                            }
                        ),
                        Text("${ticket?.purchasedTickets ?? 0}"),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                ProfileMenu(
                  text: "$userType Account",
                  icon: "assets/icons/User Icon.svg",
                  navigation: userType=="student" ? StudentAccount(student: user)
                                                  : (userType=="teacher")
                                                    ? TeacherAccount(teacher: user)
                                                    : StaffAdminAccount(staff: user)
                ),
                ProfileMenu(
                  text: "$userType Reservations",
                  icon: "assets/icons/Bell.svg",
                  navigation: const UserReservations(),
                ),
                ProfileMenu(
                  text: "$userType Settings",
                  icon: "assets/icons/Settings.svg",
                  navigation: userType=="student" ? SettingsStudentPage(student: user, userService: userService)
                                                 : (userType=="teacher")
                                                   ? SettingsTeacherPage(teacher: user,userService: userService,)
                                                    : SettingsStaffPage(staff: user,userService: userService,)


               ),
              ],
            ),
          )
          )
    );
  }
}
