import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utlis/constants/sizes.dart';
class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address',buttonTitle: 'Change',onPressed: (){},),
        Text('Raj Abhishekh',style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems /2,),

        Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems ,),
            Text('+(91) 9508345778',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems ,),
        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems ,),
            Expanded(child: Text('NIT jalandhar ,Near GT road Amritsar bypass ,punjab,811101',style: Theme.of(context).textTheme.bodyMedium,)),
          ],
        ),
        // const SizedBox(height: TSizes.spaceBtwItems ,),
      ],
    );
  }
}
