import 'package:flutter/material.dart';
import '../models/director.dart';

class DirectorAccount extends StatefulWidget {
  Director? director;
  DirectorAccount({Key? key,required this.director}) : super(key: key);
  @override
  State<DirectorAccount> createState() => _DirectorAccountState();
}

class _DirectorAccountState extends State<DirectorAccount> {

  @override
  Widget build(BuildContext context) {
    widget.director;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        title:  const Text("Director Account ", style : TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.blueGrey,
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          textContent("Email",widget.director?.emailDirector),
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