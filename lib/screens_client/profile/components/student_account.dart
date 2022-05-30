import 'package:flutter/material.dart';
import '../../../models/student.dart';

class StudentAccount extends StatefulWidget {
  Student? student;
  StudentAccount({Key? key,required this.student}) : super(key: key);
  @override
  State<StudentAccount> createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {

  @override
  Widget build(BuildContext context) {
    widget.student;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        title:  const Text("Student Account ", style : TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
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
              backgroundImage: AssetImage("assets/images/Profile Image.png"),
              //backgroundImage: _imageFile == null
              //? const AssetImage("assets/images/Profile Image.png")
              //: FileImage(File(_imageFile.path)) as ImageProvider,
            ),
          ),
          const SizedBox(height: 30),
          const Divider(thickness: 0.8),
          textContent("Username",widget.student?.userName),
          const Divider(thickness: 0.8),
          textContent("Gender",widget.student?.gender),
          const Divider(thickness: 0.8),
          textContent("Department",widget.student?.major),
          const Divider(thickness: 0.8),
          textContent("Email",widget.student?.email),
          const Divider(thickness: 0.8),
          textContent("Education",widget.student?.education),
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