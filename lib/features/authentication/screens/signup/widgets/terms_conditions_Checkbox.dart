import 'package:android_d/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/constants/text_strings.dart';
import '../../../../../utlis/helpers/helper_functions.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
    // required this.dark,
  });

  // final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller =SignupController.instance;
    final dark= THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(()=> Checkbox(value: controller.privacyPolicy.value, onChanged: (value) { controller.privacyPolicy.value =!controller.privacyPolicy.value; })),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Expanded(
          child: Wrap(
            children: [
              // TextSpan(
              //   text: "${TTexts.iAgreeTo} ",
              //   style: Theme.of(context).textTheme.bodySmall,
              // ),
              Text("${TTexts.iAgreeTo} ",style: Theme.of(context).textTheme.bodySmall),
              Text(
                '${TTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary,
                ),
              ),
              Text(
                "${TTexts.and} ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary,
                ),
              ),
            ],
            // style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );

  }
}