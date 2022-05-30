import 'package:pfa_mobile_app/models/client.dart';

class Staff extends Client{
  String? staffUID ;
  String? workPlace ;
  bool? isAdministrative ;

  Staff(String? userName, String? gender, String? email, String? password,{this.staffUID,this.workPlace,this.isAdministrative}): super(email: email,gender: gender, password: password,userName: userName);

  // getting data from server
  factory Staff.fromMap(map)
  {
    return Staff(
      map['userName'],
      map['gender'],
      map['email'],
      map['password'],
      staffUID: map['staffUID'],
      isAdministrative:  map['administration'],
      workPlace:  map['work place'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap()
  {
    return {
      "staffUID": staffUID,
      "work place":  workPlace,
      "administration" : isAdministrative,
      "email":  email,
      "gender": gender,
      "password":  password,
      "userName": userName,
    };
  }
}