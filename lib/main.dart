import 'package:android_d/app.dart';
// import 'package:android_d/utlis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //Add Widgets Bindings
  final WidgetsBinding widgetsBinding =WidgetsFlutterBinding.ensureInitialized();
  //Init Local Storage
  await GetStorage.init();
  //Init Payment Methods
  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Initialize Firebase


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository( )),
  );

  //Initialize Authentication
  runApp(const App());
}




// ...




