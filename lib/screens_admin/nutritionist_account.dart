import 'package:flutter/material.dart';
import 'package:pfa_mobile_app/models/nutritionist.dart';
import '../../../models/student.dart';
import '../models/director.dart';

class NutritionistAccount extends StatefulWidget {
  Nutritionist? nutritionist;
  NutritionistAccount({Key? key,required this.nutritionist}) : super(key: key);
  @override
  State<NutritionistAccount> createState() => _NutritionistAccountState();
}

class _NutritionistAccountState extends State<NutritionistAccount> {

  @override
  Widget build(BuildContext context) {
    widget.nutritionist;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        title:  const Text("Nutritionist Account ", style : TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.blueGrey,
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          textContent("Email",widget.nutritionist?.emailNutritionist),
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