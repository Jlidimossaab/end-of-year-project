import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  XFile? _imageFile;
  final ImagePicker _picker= ImagePicker();
  @override
  Widget build(BuildContext context) {
     return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
            CircleAvatar(
             //backgroundImage: AssetImage("assets/images/Profile Image.png"),
            backgroundImage: _imageFile == null
                ?  const AssetImage("assets/images/staff administrator.png")
                : FileImage(File(_imageFile!.path)) as ImageProvider,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((builder)=> bottomSheet())
                  );
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: 100.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: [
        const Text(
          "Choose Profile photo",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20 ,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: (){
                takePhoto(ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            FlatButton.icon(
              icon: const Icon(Icons.image),
              onPressed: (){
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ],
        ),
      ],
      ),
    );
  }
  Future takePhoto(ImageSource source) async{
    final pickedFile = await _picker.pickImage(
        source: source
    );
    setState(() {
      _imageFile = pickedFile! ;
    });
  }
}
