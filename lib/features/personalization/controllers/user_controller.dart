
import 'package:android_d/data/repositories/user/user_repository.dart';
import 'package:android_d/features/personalization/models/user_models.dart';
import 'package:android_d/utlis/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get instance =>Get.find();

  final userRepository =Get.put(UserRepository());

  /// Save user Records from any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try{
      if(userCredentials!=null){
        //convert nae to first and last name
        final nameParts= UserModel.nameParts(userCredentials.user!.displayName ?? "");
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        //Map DATA
        final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length>1? nameParts.sublist(1).join(' '): '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
        );

        //Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: "Data not saved",
        message:
            'Something went wrong while saving your information. you can re_save your data in your Profile.',
      );
    }
  }
}