
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfa_mobile_app/screens_client/feedbackPage.dart';

import '../../../customs/sharedElements/BigText.dart';
import '../../../models/staff.dart';
import '../../../models/teacher.dart';
import '../../../services/user_service.dart';
import '../../logIn.dart';
import '../../welcome.dart';

class SettingsStaffPage extends StatefulWidget {
  Staff staff;
  UserService userService;
  SettingsStaffPage({Key? key,required this.staff,required this.userService}) : super(key: key);
  @override
  State<SettingsStaffPage> createState() => _SettingsStaffPageState();
}

class _SettingsStaffPageState extends State<SettingsStaffPage> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _newUsername = TextEditingController();
  final TextEditingController _newEmail = TextEditingController();
  final TextEditingController _newGender = TextEditingController();
  final TextEditingController _newWorkplace = TextEditingController();
  final TextEditingController _newDepartment = TextEditingController();

  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context,) {
    widget.staff;
    return Scaffold(
      appBar: AppBar(
        title:  BigText(text: "Settings"),
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.green,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 65, right: 16),
        child: ListView(
          children: [
            Row(
              children: const [
                Icon(
                  Icons.person, color: Colors.green,
                ),
                SizedBox(width: 8,),
                Text("Account", style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            const Divider(
                height: 15, thickness: 2
            ),
            const SizedBox(
              height: 30
              ,),
            buildAccountPasswordRow(context),
            const SizedBox(height: 20,),
            buildAccountRow(context, "Change Username","New Username",_newUsername,'userName'),
            const SizedBox(height: 20,),
            buildAccountRow(context, "Change Email","New Email",_newEmail,'email'),
            const SizedBox(height: 20,),
            buildAccountRow(context, "Change Gender","New Gender",_newGender,'gender'),
            const SizedBox(height: 20,),
            buildAccountRow(context, "Change Workplace","New Workplace",_newWorkplace,'work place'),
            const SizedBox(height: 20,),
            buildDeleteAccountRow(context),
            const Divider(
                height: 15, thickness: 2
            ),
            Center(
              child: OutlineButton(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn() ),);
                  },
                  child: const Text(
                    "SIGN OUT", style: TextStyle(
                    fontSize: 16, letterSpacing: 2.2, color: Colors.black,
                  ),)
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountPasswordRow(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Change Password"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: _currentPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'current password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: _newPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'New Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: _confirmPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm password',
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              },
                child: const Text("Close"),
              ),
              TextButton(onPressed: () {
                if(_formKey.currentState!.validate() && _currentPassword.text == widget.staff.password){
                  widget.userService.ChangeUserPassword(_newPassword.text);
                  widget.userService.ChangeUserAttributes(_newPassword.text, 'password',userService.getStaffCollection());
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LogIn() )
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.orangeAccent,
                      content: Text(
                        'Your Password has been Changed. Login again',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }
              },
                child: const Text("Edit"),
              ),
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Change Password", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey,
            ),
          ],),
      ),
    );
  }

  GestureDetector buildAccountRow(BuildContext context, String label,
      String hintedText, TextEditingController textForm, String choice) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(label),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: textForm,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: hintedText,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              },
                child: const Text("Close"),
              ),
              TextButton(onPressed: () {
                widget.userService.ChangeUserAttributes(textForm.text, choice,userService.getStaffCollection());
                Navigator.of(context).pop();
              },
                child: const Text("Edit"),
              ),
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Change $choice", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey,
            ),
          ],),
      ),
    );
  }
  GestureDetector buildDeleteAccountRow(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Are you sure?"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              const Text("Deleting this account will result in completely removing your account from the system and you won't be able to access this app"),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: _currentPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Verify ur password ",
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              },
                child: const Text("Close"),
              ),
              TextButton(onPressed: () async {
                if( _currentPassword.text == widget.staff.password){
                await widget.userService.deleteUserDoc(widget.userService.getStaffCollection());
                widget.userService.user?.delete();
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Welcome())
                );
                }
              },
                child: const Text("delete")
              ),
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Delete Account", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey,
            ),
          ],),
      ),
    );
  }
}