import 'package:android_d/utlis/exceptions/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/personalization/models/user_models.dart';
import '../../../utlis/exceptions/format_exceptions.dart';
import '../../../utlis/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance =>Get.find();

  final FirebaseFirestore _db =FirebaseFirestore.instance;

  /// Function to save user data to firestore.


  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("users").doc(user.id).set(user.toJson());
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }
  }

}