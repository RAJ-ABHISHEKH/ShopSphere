import 'package:android_d/features/authentication/controllers/login/login_controller.dart';
import 'package:android_d/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:android_d/features/authentication/screens/signup/signup.dart';
import 'package:android_d/navigation_menu.dart';
import 'package:android_d/utlis/validators/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              controller: controller.email,
              validator: (value)=>TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.arrow_forward_outlined),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            ///Password
            Obx(
              ()=> TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validateEmptyText('Password',value),
                // validator: (value) => TValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(labelText: TTexts.password,prefixIcon: const Icon(Icons.password),suffixIcon: IconButton(onPressed: ()=>controller.hidePassword.value =!controller.hidePassword.value, icon: Icon(controller.hidePassword.value? Icons.visibility_off :Icons.visibility))),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),
            // Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // children: [
            ///Remember me and Forget Password
            Row(
              children: [
                Flexible(
                  flex: 1,
                  ///Remember Me
                  child: Obx(
                    () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value),
                  ),
                ),
                const Flexible(
                  flex: 2,
                  child: Text(
                    TTexts.rememberMe,
                  ),
                ),
                Flexible(
                  flex: 2,
                  ///Forget Password
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const ForgetPassword());
                    },
                    child: const Text(
                      TTexts.forgetPassword,
                      textAlign: TextAlign.right,
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),

            //   ],
            // ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///Sign In Button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>controller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            ///Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: const Text(TTexts.createAccount),
              ),
            ),
            // const SizedBox(height: TSizes.spaceBtwSections,),
          ],
        ),
      ),
    );
  }
}
