import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' ;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfa_mobile_app/customs/sharedElements/AppColors.dart';
import 'package:pfa_mobile_app/customs/sharedElements/SmallText.dart';
import 'package:pfa_mobile_app/models/UserFeedback.dart';
import 'package:pfa_mobile_app/screens_client/menuItemBody.dart';
import 'package:pfa_mobile_app/services/user_service.dart';
import '../customs/sharedElements/AppIcon.dart';
import '../customs/sharedElements/BigText.dart';
import '../services/feedback_service.dart';
import 'home.dart';
UserService userService = UserService( database: FirebaseFirestore.instance); //user: FirebaseAuth.instance.currentUser
class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key? key}) : super(key: key);
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController sampledata = TextEditingController();
  int _value1=1;
  int _value2=1;
  int _value3=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold  (
      appBar: AppBar(
        title: BigText(text: "Feedback "),
          leading: const BackButton(
          color : AppColors.textColor,
          ),
        ),
        body : SingleChildScrollView(
          child: Column(
              children: <Widget>[
                const SizedBox(height: 20 ,),
                const Text("Review",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    radioButtons1("Taste"),
                    const SizedBox(width: 20,),
                    radioButtons2("Quality"),
                    const SizedBox(width: 20,),
                    radioButtons3("Quantity"),
                  ],
                ),
                const Divider(thickness:2),
                Row(
                  children: const[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 120, vertical: 20),
                      child: Text("Send Feedback", style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        child: TextFormField(
                          minLines: 4,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          controller: sampledata,
                          decoration: const InputDecoration(
                              hintText: 'Enter ur feedback here',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10)),
                              )
                          ),
                        )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        manageFeedback();
                      },
                      child: const Text("Send"),),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Cancel"),),
                  ],
                ),
              ],
        ),
      ),

      );

}
  String tasteReview(){
    if(_value1==1){
      return "Tasty";
    }
    else if(_value1==2){
      return "Ordinary";
    }
    return "Bad";
  }
  String qualityReview(){
    if(_value2==1){
      return "Great";
    }
    else if(_value2==2){
      return "normal";
    }
    return "Bad";
  }
  String quantityReview(){
    if(_value3==1){
      return "Too much";
    }
    else if(_value3==2){
      return "Enough";
    }
    return "Little";
  }


  void manageFeedback() async {
    FeedbackService feedbackService = FeedbackService(userService: userService);
    UserFeedback feedback = UserFeedback(date:DateTime.now()
        ,description: sampledata.text
        ,tasteReview:tasteReview()
        ,qualityReview:qualityReview()
        ,quantityReview: quantityReview()
    );
    await feedbackService.createFeedback(feedback);
    Fluttertoast.showToast(msg: "Thanks for your feedback ");
    //}
  }




  Column radioButtons1(String review) => Column(

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Divider(thickness: 4),
      Text(review,style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 1,
            groupValue: _value1,
            onChanged: (value){
              setState(() {
                _value1=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Tasty"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 2,
            groupValue: _value1,
            onChanged: (value){
              setState(() {
                _value1=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Ordinay"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 3,
            groupValue: _value1,
            onChanged: (value){
              setState(() {
                _value1=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Bad"),
        ],
      ),
    ],
  );
  Column radioButtons2(String review) => Column(

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Divider(thickness: 4),
      Text(review,style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 1,
            groupValue: _value2,
            onChanged: (value){
              setState(() {
                _value2=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Great"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 2,
            groupValue: _value2,
            onChanged: (value){
              setState(() {
                _value2=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Normal"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 3,
            groupValue: _value2,
            onChanged: (value){
              setState(() {
                _value2=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Bad"),
        ],
      ),
    ],
  );
  Column radioButtons3(String review) => Column(

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Divider(thickness: 4),
      Text(review,style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 1,
            groupValue: _value3,
            onChanged: (value){
              setState(() {
                _value3=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Too much"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 2,
            groupValue: _value3,
            onChanged: (value){
              setState(() {
                _value3=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Enough"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Radio(
            value: 3,
            groupValue: _value3,
            onChanged: (value){
              setState(() {
                _value3=value.hashCode;
              });
            },
          ),
          const SizedBox(height: 10.0,),
          const Text("Little"),
        ],
      ),
    ],
  );
}