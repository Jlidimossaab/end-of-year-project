import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    //this.press,
    required this.navigation,
  }) : super(key: key);
  final String text, icon;
  //final VoidCallback? press;
  final Widget navigation ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFECEFF1),
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigation),);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text,style: const TextStyle(
              color: Colors.blue
            ),)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
