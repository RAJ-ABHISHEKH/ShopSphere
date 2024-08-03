import 'package:flutter/material.dart';

import 'package:android_d/utlis/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style:Theme.of(context).textTheme.bodyMedium ,),
            Text("\$256.0",style:Theme.of(context).textTheme.bodyMedium ,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        /// shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style:Theme.of(context).textTheme.bodyMedium ,),
            Text("\$6.0",style:Theme.of(context).textTheme.labelLarge ,),
          ],
        ),
        /// Tax Fee
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee',style:Theme.of(context).textTheme.bodyMedium ,),
            Text("\$6.0",style:Theme.of(context).textTheme.labelLarge ,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("order total",style:Theme.of(context).textTheme.bodyMedium ,),
            Text("\$6.0",style:Theme.of(context).textTheme.titleMedium ,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
      ],
    );
  }
}
