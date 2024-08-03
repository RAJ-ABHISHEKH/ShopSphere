import 'package:android_d/features/authentication/controllers/onboarding/onbaording_controller.dart';
import 'package:android_d/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:android_d/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:android_d/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/constants/text_strings.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/device/device_utility.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),

          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
          // Positioned(
          //   bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
          //   left: TSizes.defaultSpace,
          //   child: SmoothPageIndicator(
          //     controller: PageController(),
          //     count: 3,
          //     effect: ExpandingDotsEffect(
          //       activeDotColor: dark ? TColors.light : TColors.dark,
          //       dotHeight: 6,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
          onPressed: () {
            OnBoardingController.instance.nextPage();
          },
          style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: dark ? TColors.primary: Colors.black),
          child: const Icon(Icons.arrow_right)),
    );
  }
}
