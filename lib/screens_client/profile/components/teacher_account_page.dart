import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../models/teacher.dart';
import '../../../services/user_service.dart';
class TeacherAccount extends StatefulWidget {
  Teacher? teacher;
  TeacherAccount({Key? key, required this.teacher}) : super(key: key);

  @override
  State<TeacherAccount> createState() => _TeacherAccountState();
}

class _TeacherAccountState extends State<TeacherAccount> {

  @override
  Widget build(BuildContext context) {

    Teacher? teacher= widget.teacher;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        title:  const Text("My Teacher Account ", style : TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.blueGrey,
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          const SizedBox(
            height: 115,
            width: 115,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/teacher profile.png"),
              //backgroundImage: _imageFile == null
              //? const AssetImage("assets/images/Profile Image.png")
              //: FileImage(File(_imageFile.path)) as ImageProvider,
            ),
          ),
          const SizedBox(height: 30),
          const Divider(thickness: 0.8),
          textContent("Username",teacher?.userName),
          const Divider(thickness: 0.8),
          textContent("Gender",teacher?.gender),
          const Divider(thickness: 0.8),
          textContent("Email",teacher?.email),
          const Divider(thickness: 0.8),
          textContent("Workspace",teacher?.workPlace),
          const Divider(thickness: 0.8),
          textContent("Department",teacher?.department),
          const Divider(thickness: 0.8),
        ],
      ),
    );
  }
  Padding textContent(String title,String? text){
    return Padding(
        padding: const EdgeInsets.fromLTRB(20,10,0,10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              "$text",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        )
    );
  }
}