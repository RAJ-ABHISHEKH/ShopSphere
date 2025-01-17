import 'dart:io';

import 'package:android_d/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:android_d/common/widgets/icons/t_circular_icon.dart';
import 'package:android_d/common/widgets/images/t_rounded_image.dart';
import 'package:android_d/common/widgets/text/product_title_text.dart';
import 'package:android_d/common/widgets/text/t-brand_title-with_verified_icon.dart';
import 'package:android_d/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../styles/shadow.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    // boxShadow: [TShadowStyle.verticalProductShadow],
    borderRadius: BorderRadius.circular(TSizes.productImageRadius),
    color: dark ? TColors.darkerGrey : TColors.softGrey,
    ),
      child: Row(
        children: [
          ///Thumbnail,Wishlist Button,Discount Tag
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark? TColors.dark:TColors.light,
            child:  Stack(
              children: [
                /// --Thumbnail Image
                const TRoundedImage(imageUrl: TImages.productImage1,applyIMageRadius: true,),

                /// Sale tag
                Positioned(
                  top: 12,

                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                      child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),

                ),
                ),

                /// Favourite Icon Button
                const Positioned(
                  top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Icons.favorite,color: Colors.red,)),
              ],
            ),
          ),

          /// details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: "Green Nike Half Sleeves Shirt ",smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems/2,),
                      TBrandTitleWithVerifiedIcon(title: "Nike"),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// pricing
                      const Flexible(child: TProductPriceText(Price: "256.0")),

                      /// Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          )
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg*1.2,
                          height: TSizes.iconLg*1.2,
                          child: Center(
                            child: Icon(Icons.add,color: TColors.white,),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

