import 'package:flutter/material.dart';
import 'package:pfa_mobile_app/customs/sharedElements/AppColors.dart';

class SmallText extends StatelessWidget {

  Color? color;
  final String text ;
  double size ;
  double height;
  bool underline ;
  SmallText({ Key? key ,
    this.height = 1.0,
    required this.text,
    this.underline =false,
    //this.color = const Color(0xFF89DAD0),
    this.color = const Color(0xFFccc7c5),
    this.size = 13,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
          color : color,
          fontFamily: 'Roboto',
          height: height,
          fontSize: size,
          decoration: underline ? TextDecoration.underline : TextDecoration.none,
        ));
  }
}