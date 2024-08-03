import 'dart:async';

import 'package:android_d/common/widgets/success_screen/success_screen.dart';
import 'package:android_d/data/repositories/authentication/authentication_repository.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/constants/text_strings.dart';
import 'package:android_d/utlis/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  /// send Email whenever Verify Screen appears and Set Timer for auto redirect.
  @override
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///Send Email Verification Link

  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email sent',message: 'Please Check your inbox and verify your email.');
    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }


///Timer to automatically redirect an Email Verification
setTimerForAutoRedirect(){
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user =FirebaseAuth.instance.currentUser;
    if(user?.emailVerified ?? false){
      timer.cancel();
      Get.off(()=> SuccessScreen(image: TImages.successfullyRegisterAnimation, title: TTexts.yourAccountCreatedTitle, subtitle: TTexts.yourAccountCreatedSubTitle, onPressed: ()=>AuthenticationRepository.instance.screenRedirect() ),);
    }
  },);
}
///Manually Check if Email Verified
 checkEmailVerificationStatus() async{
    final currentUser =FirebaseAuth.instance.currentUser;
    if(currentUser !=null && currentUser.emailVerified){
      Get.off(()=> SuccessScreen(image: TImages.onBoardingImage1, title: TTexts.yourAccountCreatedTitle, subtitle: TTexts.yourAccountCreatedSubTitle, onPressed: ()=>AuthenticationRepository.instance.screenRedirect() ),);
    }
 }
}