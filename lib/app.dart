import 'package:android_d/bindings/general_bindings.dart';
import 'package:android_d/features/authentication/screens/onboarding/onboarding.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightheme,
      darkTheme: TAppTheme.darktheme,
      initialBinding: GeneralBindings(),
      /// show loader or circular progress indicator meanwhile Authentication Repository is deciding to show relevant screen.

      // home: const OnBoardingScreen(),
      home: const Scaffold(backgroundColor: TColors.primary,body: Center(child: CircularProgressIndicator(color: TColors.white,),),) ,
    );
  }
}
