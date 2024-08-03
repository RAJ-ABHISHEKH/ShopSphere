

import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:android_d/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:android_d/features/shop/screens/product_reviews/widgets/user-review_card.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../common/widgets/products/ratings/rating-indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// Appbar
      appBar: const TAppBar(title: Text('Reviews & Ratings'),showBackArrow: true,),


      /// Body
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ratings and reviews are verified and are from people who use the same type of device that you use.'),
             const SizedBox(height: TSizes.spaceBtwItems,),

            /// overall Product Ratings
            const TOverallProductRating(),
            const TRatingBarIndicator(rating: 4.5,),
            Text("12,611",style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// user Reviews List
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
        ),

      ),
    );
  }
}






