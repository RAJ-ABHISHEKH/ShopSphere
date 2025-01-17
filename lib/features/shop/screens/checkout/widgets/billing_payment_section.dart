
import 'package:android_d/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:android_d/common/widgets/text/section_heading.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utlis/constants/sizes.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method',buttonTitle: 'Change',onPressed: (){},),
        const SizedBox(height: TSizes.spaceBtwItems /2,),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain,),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ],
    );
  }
}
