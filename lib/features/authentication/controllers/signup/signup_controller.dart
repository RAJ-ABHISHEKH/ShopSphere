
import 'package:android_d/data/repositories/authentication/authentication_repository.dart';
import 'package:android_d/data/repositories/user/user_repository.dart';
import 'package:android_d/features/authentication/screens/signup/verify_email.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/popups/full_screen_loader.dart';
import 'package:android_d/utlis/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../utlis/helpers/network_manager.dart';
import '../../../personalization/models/user_models.dart';

class SignupController extends GetxController {
  static SignupController get instance =>Get.find();

  /// variables
  final hidePassword =true.obs; // Observe for hiding /showing password
final privacyPolicy =true.obs; // Observe for Privacy Policy Acceptance
  final email =TextEditingController();// Controller for email input
  final lastName =TextEditingController();// Controller for last name input
  final username =TextEditingController();// Controller for  username input
  final password =TextEditingController(); // Controller for password input
  final firstName =TextEditingController(); // Controller for for first name input
  final phoneNumber =TextEditingController(); // Controller for for phone number input
  GlobalKey<FormState> signupFormKey =GlobalKey<FormState>(); // form key for form validation

  /// --SIGNUP
  void signup() async {
   try{
     // start Loading
     TFullScreenLoader.openLoadingDialog('We are processing your information....', TImages.docerAnimation);
     // check Internet Connectivity
     final isConnected =await NetworkManager.instance.isConnected();
     if(!isConnected){
       // Remove Loader
       TFullScreenLoader.stopLoading();
       return;
     }
     // Form Validation
     if(signupFormKey.currentState!.validate()){
        // Remove Loader
       TFullScreenLoader.stopLoading();
       return;
     }
     // Privacy Policy Check
     if(!privacyPolicy.value){
       TLoaders.warningSnackBar(title: "Accept Privacy Policy",message: 'In order to create account, you must have to read and accept the Privacy Policy and Terms of Use.',);
       return;
     }
     //Register user in the firebase Authentication and Save user in the firebase

     final userCredential=await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

     // Save Authenticated user data in the firebase Firestore
     final newUser =UserModel(id:userCredential.user!.uid,
     firstName :firstName.text.trim(),
       lastName :lastName.text.trim(),
       username :username.text.trim(),
       email: email.text.trim(),
       phoneNumber: phoneNumber.text.trim(),
       profilePicture: " ",
     );
     final userRepository =Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

     // Remove Loader
     TFullScreenLoader.stopLoading();


     // Show Success Message
     TLoaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created Verify email to continue.');
     // Move to Verify Email SCREEN
      Get.to(()=>VerifyEmailScreen(email: email.text.trim(),));
   }catch(e){

     // Remove Loader
     TFullScreenLoader.stopLoading();

     // show some Generic Error to the user
     TLoaders.errorSnackBar(title: 'oh Snap!',message: e.toString());
   }
 }
}