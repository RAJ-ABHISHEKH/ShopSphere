import 'package:android_d/features/authentication/controllers/signup/signup_controller.dart';
import 'package:android_d/features/authentication/screens/signup/verify_email.dart';
import 'package:android_d/features/authentication/screens/signup/widgets/terms_conditions_Checkbox.dart';
import 'package:android_d/utlis/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';
class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    // final dark= THelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [
        /// first name and last name
        Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => TValidator.validateEmptyText('First Name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Icons.person)),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields,),
            Flexible(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => TValidator.validateEmptyText('Last Name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.lastName,prefixIcon: Icon(Icons.person)),
              ),
            ),
            // const SizedBox(width: TSizes.spaceBtwInputFields,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),
        /// username

        TextFormField(
          controller: controller.username,
          validator: (value) => TValidator.validateEmptyText('username', value),
          expands: false,
          decoration: const InputDecoration(labelText: TTexts.username,prefixIcon: Icon(Icons.edit)),
        ),

        /// Email
        const SizedBox(height: TSizes.spaceBtwInputFields,),
        TextFormField(
          controller: controller.email,
          validator: (value) => TValidator.validateEmail(value),
          expands: false,
          decoration: const InputDecoration(labelText: TTexts.email,prefixIcon: Icon(Icons.send)),
        ),

        /// phone number
        const SizedBox(height: TSizes.spaceBtwInputFields,),
        TextFormField(
          controller: controller.phoneNumber,
          validator: (value) => TValidator.validatePhoneNumber(value),
          expands: false,
          decoration: const InputDecoration(labelText: TTexts.phoneNo,prefixIcon: Icon(Icons.call)),
        ),

        /// password
        const SizedBox(height: TSizes.spaceBtwInputFields,),
        Obx(
          ()=> TextFormField(
            controller: controller.password,
            validator: (value) => TValidator.validatePassword(value),
            expands: false,
            obscureText: controller.hidePassword.value,
            decoration: InputDecoration(labelText: TTexts.password,prefixIcon: const Icon(Icons.password),suffixIcon: IconButton(onPressed: ()=>controller.hidePassword.value =!controller.hidePassword.value, icon: Icon(controller.hidePassword.value? Icons.visibility_off :Icons.visibility))),
          ),
        ),
        /// Therms and condition checkboxes
        const SizedBox(height: TSizes.spaceBtwSections,),
        const TTermsAndConditionCheckbox(),

        /// sign up Button
        const SizedBox(height: TSizes.spaceBtwSections,),
        SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.signup()
        ,child: const Text(TTexts.createAccount),),),
      ],
    ),);
  }
}

