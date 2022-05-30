import 'package:flutter/material.dart';
import '../../../models/staff.dart';
import '../../../models/student.dart';

class StaffAdminAccount extends StatefulWidget {
  Staff? staff;
  StaffAdminAccount({Key? key,required this.staff}) : super(key: key);
  @override
  State<StaffAdminAccount> createState() => _StaffAdminAccountState();
}

class _StaffAdminAccountState extends State<StaffAdminAccount> {

  @override
  Widget build(BuildContext context) {
    widget.staff;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        title:   Text("staff ${widget.staff?.isAdministrative==true?"Administrator":"simple"} Account ", style : const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.blueGrey,
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          const SizedBox(
            height: 135,
            width: 135,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/staff administrator.png"),
              //backgroundImage: _imageFile == null
              //? const AssetImage("assets/images/Profile Image.png")
              //: FileImage(File(_imageFile.path)) as ImageProvider,
            ),
          ),
          const SizedBox(height: 30),
          const Divider(thickness: 0.8),
          textContent("Username",widget.staff?.userName),
          const Divider(thickness: 0.8),
          textContent("Gender",widget.staff?.gender),
          const Divider(thickness: 0.8),
          textContent("Email",widget.staff?.email),
          const Divider(thickness: 0.8),
          textContent("Workplace",widget.staff?.workPlace),
          const Divider(thickness: 0.8),
          textContent("Post","administrator"),
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