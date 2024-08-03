
import 'package:android_d/data/repositories/authentication/authentication_repository.dart';
import 'package:android_d/features/personalization/controllers/user_controller.dart';
import 'package:android_d/utlis/helpers/network_manager.dart';
import 'package:android_d/utlis/local_storage/storage_utility.dart';
import 'package:android_d/utlis/popups/full_screen_loader.dart';
import 'package:android_d/utlis/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utlis/constants/image_strings.dart';

class LoginController extends GetxController{
  // variables
  final localStorage =GetStorage();
  final rememberMe =false.obs;
  final hidePassword =true.obs;
  final email=TextEditingController();
  final password=TextEditingController();
  GlobalKey<FormState>loginFormKey =GlobalKey<FormState>();
  final userController =Get.put(UserController());

  @override
  void onInit(){
    email.text =localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text =localStorage.read('REMEMBER_ME_PASSWORD') ?? "";
    super.onInit();
  }

  /// --Email and Password SignIn

  Future<void> emailAndPasswordSignIn() async{
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in___',TImages.docerAnimation );

      //Check Internet Connectivity
      final isConnected =await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      //Save Data if Remember me is selected
      if(rememberMe.value){
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", email.text.trim());
      }

      // Login user using Email and Password Authentication
      final userCredentials =await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(),password.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  ///Google SignIn Authentication

  Future<void> googleSigIn() async{
    try{

      //Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in___',TImages.docerAnimation );

      //Check Internet Connectivity
      final isConnected =await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      //Google Authentication
      final userCredentials =await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      userController.saveUserRecord(userCredentials);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      //Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}