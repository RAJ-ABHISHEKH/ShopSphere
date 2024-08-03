import 'package:flutter/material.dart';

import '../../../../../utlis/constants/sizes.dart';
import '../../../../../utlis/helpers/helper_functions.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  final String image, title, subtitle;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: THelperFunctions.screenHeight() * 0.8,
              height: THelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image)),
          // Image.asset(
          //   TImages.onBoardingImage1,
          //   height: 100,
          //   width: 100,
          // ),
          Text(
            // TTexts.onBoardingTitle1,
            title,
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            // TTexts.onBoardingsubTitle1,
            subtitle,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}