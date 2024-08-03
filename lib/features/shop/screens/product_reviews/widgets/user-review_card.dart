import 'package:android_d/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:android_d/common/widgets/products/ratings/rating-indicator.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utlis/constants/image_strings.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark= THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Doe',style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Nov, 2023',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText("The user interface of the app is quite intuitive .I was able to navigate and mark purchases seamlessly.Great job!",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        ///company Review
        TRoundedContainer(
          backgroundColor: dark? TColors.darkerGrey: TColors.grey,
          child: Padding(padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("T's Store",style: Theme.of(context).textTheme.titleMedium,),
                  Text("02 Nov, 2023",style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const ReadMoreText("The user interface of the app is quite intuitive .I was able to navigate and mark purchases seamlessly.Great job!",
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: 'show less',
                trimCollapsedText: 'show more',
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
              ),
            ],
          ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),


      ],
    );
  }
}
