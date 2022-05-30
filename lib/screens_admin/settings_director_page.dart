
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../customs/sharedElements/BigText.dart';
import '../../../services/user_service.dart';
import '../models/director.dart';
import '../screens_client/feedbackPage.dart';
import '../screens_client/logIn.dart';

class SettingsDirectorPage extends StatefulWidget {
  Director director;
  UserService userService;
  SettingsDirectorPage({Key? key,required this.director,required this.userService}) : super(key: key);
  @override
  State<SettingsDirectorPage> createState() => _SettingsDirectorPageState();
}

class _SettingsDirectorPageState extends State<SettingsDirectorPage> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _newEmail = TextEditingController();


  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context,) {
    widget.director;
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Settings"),
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
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const SizedBox(height: 30,),
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
            buildAccountRow(context, "Change Email", "NewEmail", _newEmail),
            buildAccountPasswordRow(context),
            const Divider(
                height: 15, thickness: 2
            ),
            const SizedBox(
              height: 10
              ,),
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
                  child: TextFormField(
                    controller: _currentPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'current password',
                    ),
                    validator: (value) {
                      return widget.director.passwordDirector == value ? null
                          : "Password doesn't exist";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  child: TextFormField(
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
                  child: TextFormField(
                    controller: _confirmPassword,
                    validator: (value) {
                      return _newPassword.text == value ? null
                          : "Please validate your entered password";
                    },
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
                if(/*formKey.currentState!.validate() &&*/ _currentPassword.text == widget.director.passwordDirector){
                  widget.userService.ChangeUserPassword(_newPassword.text);
                  widget.userService.ChangeUserAttributes(_newPassword.text, 'passwordDirector',userService.getDirectorsCollection());
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
      String hintedText, TextEditingController textForm) {
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
                widget.userService.ChangeUserAttributes(textForm.text, 'email',userService.getDirectorsCollection());
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
            Text("Change Director's email", style: TextStyle(
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