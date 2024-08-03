import 'package:android_d/features/authentication/screens/login/login.dart';
import 'package:android_d/features/authentication/screens/onboarding/onboarding.dart';
import 'package:android_d/features/authentication/screens/signup/verify_email.dart';
import 'package:android_d/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utlis/exceptions/firebase_auth_exceptions.dart';
import '../../../utlis/exceptions/firebase_exceptions.dart';
import '../../../utlis/exceptions/format_exceptions.dart';
import '../../../utlis/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance =>Get.find();

  /// variables
  final deviceStorage =GetStorage();
  final _auth =FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady(){
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// function to show Relevant screen
  void screenRedirect() async{
    final  user=_auth.currentUser;

    if(user !=null){
      // if the user is logged in
      if(user.emailVerified){
        // if the user's email is verified ,navigate to the main Navigation Menu
        Get.offAll(()=>const NavigationMenu());
      }else{
        // If the user's email is not verified ,navigate to the VerifyEmailScreen
        Get.offAll(()=>VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else {
      // Local storage

      // if (kDebugMode){
      //   print("=============== GET STORAGE ===========");
      //   print(deviceStorage.read("IsFirstTime"));
      // }


      deviceStorage.writeIfNull("IsFirstTime", true);
      //check if it's first time launching the app
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const LoginScreen())//Redirect to the login Screen if not the first time
          : Get.offAll(const OnBoardingScreen());//Redirect to OnBoarding Screen if its the first time
    }
  }
  /* ---------------------------------Email and Password Sign-In--------------------------------------------------*/
///[EmailAuthentication]--SignIn

  Future<UserCredential> loginWithEmailAndPassword(String email,String password) async{
    try{
      //this is the built in function in firebase authentication
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong .Please try again';
    }
  }

///[EmailAuthentication]--Register

  Future<UserCredential> registerWithEmailAndPassword(String email,String password) async{
    try{
      //this is the built in function in firebase authentication
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong .Please try again';
    }
  }
///[EmailAuthentication]--Register

  Future<void> sendEmailVerification() async{
    try{
      //this is the built in function in firebase authentication
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong .Please try again';
    }
  }

  /// [ReAuthentication] --ReAuthentication User
  /// [EmailAuthentication] --Forget PASSWORD

/* ---------------------------- Federated identity and social sign-in--------------------------------*/
///[GoogleAuthentication] -GOOGLE
  Future<UserCredential> signInWithGoogle() async{
    try{
      //Trigger the authentication flow
      final GoogleSignInAccount? userAccount =await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      //Create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken: googleAuth?.idToken);
      //Once signed in ,return  the UserCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong .Please try again';
    }
  }
///[FacebookAuthentication] -FACEBOOK
/* ---------------------------- Federated identity and social sign-in--------------------------------*/
  ///[LogoutUser] - Valid for any authentication

  Future<void> logout() async{
    try{
      //this is the built in function in firebase authentication
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>const  LoginScreen());
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong .Please try again';
    }
  }

  ///[DeleteUser] - Remove user auth and Firebase Account
}
