import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:android_d/common/widgets/icons/t_circular_icon.dart';
import 'package:android_d/common/widgets/images/t_rounded_image.dart';
import 'package:android_d/common/widgets/text/section_heading.dart';
import 'package:android_d/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:android_d/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:android_d/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:android_d/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:android_d/features/shop/screens/product_details/widgets/rating-share-widget.dart';
import 'package:android_d/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../utlis/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image Slider
            const TProductImageSlider(),

            /// product details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -Ratings and share
                  const TRatingAndShare(),

                  /// -price,Title,Stock, and Brand
                  const TProductMetaData(),

                  /// --Attributes
                  const TProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// -- Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText('This is a Product description for Blue Nike Sleeve less vest. There are many things that can be added here but i am just practicing and nothing else ',
                  trimCollapsedText:'Show More',
                    trimExpandedText:'Less' ,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 14),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(199)',
                        showActionButton: false,),
                      IconButton(onPressed: ()=> Get.to(()=>const ProductReviewScreen()) , icon: const Icon(Icons.arrow_forward_ios_sharp,size: 18,),)

                    ],
                  ),


                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
