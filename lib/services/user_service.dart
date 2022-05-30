import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserService{

  User? user ;
  FirebaseFirestore database ;

  UserService({ required this.database,  this.user}) ;

  CollectionReference getMenusCollection(){
    return database.collection("menus");
  }

  CollectionReference getTicketsCollection(){
    return database.collection("tickets");
  }
  CollectionReference getStaffCollection(){
    return database.collection("staff");
  }

  CollectionReference getTeachersCollection(){
    return database.collection("teachers");
  }

  CollectionReference getStudentsCollection(){
    return database.collection("students");
  }

  CollectionReference getNutritionistCollection(){
    return database.collection("nutritionist");
  }

  CollectionReference getDirectorsCollection(){
    return database.collection("director");
  }

  Future<DocumentSnapshot<Object?>> getUserNutritionist() async{
    return await  getNutritionistCollection()
        .doc(user!.uid)
        .get();
  }

  Future<DocumentSnapshot<Object?>> getUserDirector() async{
    return await getDirectorsCollection()
        .doc(user!.uid)
        .get();
  }

  Future<DocumentSnapshot<Object?>> getUserTeacher() async{
    return await
    getTeachersCollection()
        .doc(user!.uid)
        .get();
  }

  Future<DocumentSnapshot<Object?>> getUserStudent() async{
    return await  getStudentsCollection()
        .doc(user!.uid)
        .get();
  }
  Future<DocumentSnapshot<Object?>> getUserStaff() async{
    return await  getStaffCollection()
        .doc(user!.uid)
        .get();
  }
  CollectionReference getUserFeedbackCollection(){
    return database.collection("feedback");
  }

  Future<String> getUserType() async {
    var data = await getUserStudent() ;
    if(data.exists){
      return "student";
    }else {
       data = await getUserTeacher();
       if(data.exists){
         return "teacher";
       }else{
         data = await getUserStaff();
         if(data.exists){
           return "staff";
         }else{
           data = await getUserDirector();
           if(data.exists){
             return "director";
           }else{
             return "nutritionist";
           }
         }
       }
    }
  }
  Future<void> deleteUserDoc(CollectionReference collection) {
    return collection
        .doc(user!.uid).delete();
  }

  Future<bool> isNutritionist() async {
    var dataNutritionist = await getUserNutritionist() ;
    if(dataNutritionist.exists){
      return true;
    }
    else {
      return false ;
    }
  }

  Future<bool> isDirector() async{
    var dataDirector = await getUserDirector();
    if(dataDirector.exists){
      return true ;
    }
    else{
      return false ;
    }
  }

  Future<void> ChangeUserPassword( String newPass )async {
    try{
      await user?.updatePassword(newPass);
      FirebaseAuth.instance.signOut();
    }catch(e){}
  }
  Future<void> ChangeUserAttributes( String newAttribute ,attribute,CollectionReference<Object?> collection)async {
    await collection
        .doc(user!.uid)
        .update({attribute:newAttribute});
  }

  Future<void> VerifyEmail() async{
      await user!.sendEmailVerification();
  }
  Future<void> ChangeEmail(String newEmail) async{
    user?.updateEmail(newEmail);
  }
}