import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfa_mobile_app/models/UserFeedback.dart';
import 'package:pfa_mobile_app/services/user_service.dart';

import '../models/UserFeedback.dart';

class FeedbackService{

  UserService userService;
  FeedbackService({required this.userService});


  // get feedback
  Future<QuerySnapshot> getFeedback() async{
    return await userService.getUserFeedbackCollection()
        .get() ;
  }

  // add feedback
  Future<void> createFeedback(UserFeedback feedback) async
  {
    await userService.getUserFeedbackCollection()
        .add(feedback.toMap());
  }
}