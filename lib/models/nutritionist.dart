class Nutritionist{
  String? nutritionistUID;
  String? passwordNutritionist;
  String? emailNutritionist;

  Nutritionist({this.emailNutritionist,this.nutritionistUID,this.passwordNutritionist});

  // this is a names constructor
  factory Nutritionist.fromMap(map){
    return Nutritionist(
      emailNutritionist : map['emailNutritionist'],
      nutritionistUID :  map['nutritionistUID'],
      passwordNutritionist : map['passwordNutritionist'],
    );
  }
}