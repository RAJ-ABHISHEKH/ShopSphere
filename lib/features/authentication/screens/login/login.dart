import 'package:android_d/common/styles/spacing_styles.dart';
import 'package:android_d/features/authentication/screens/login/widgets/login_form.dart';
import 'package:android_d/features/authentication/screens/login/widgets/login_header.dart';
import 'package:android_d/utlis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utlis/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithAppBarHeight,
          child: Column(
            children: [
              //   logo,
              const TLoginHeader(),

              //// Form
              const TLoginForm(),

              // divider
              TFormDivider(
                dividertext: TTexts.orSignInWith.capitalize!,
              ),

              const SizedBox(
                width: TSizes.spaceBtwSections,
              ),

              // footer

              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
