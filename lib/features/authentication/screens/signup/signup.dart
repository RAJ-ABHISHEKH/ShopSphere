import 'package:android_d/common/widgets/login_signup/form_divider.dart';
import 'package:android_d/common/widgets/login_signup/social_buttons.dart';
import 'package:android_d/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //// title
              Text(TTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              
              /// Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections,),
              /// divider
              TFormDivider(dividertext:TTexts.orSignUpWith.capitalize! ,),

              /// SocialButtons
              const SizedBox(height: TSizes.spaceBtwSections,),
              const TSocialButtons(),

            ],
          ),
          
        ),
      ),
    );
  }
}


