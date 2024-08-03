import 'package:android_d/common/styles/shadow.dart';
import 'package:android_d/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:android_d/common/widgets/images/t_rounded_image.dart';
import 'package:android_d/common/widgets/text/product_title_text.dart';
import 'package:android_d/common/widgets/text/t-brand_title-with_verified_icon.dart';
import 'package:android_d/features/shop/screens/product_details/product_detail.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../utlis/constants/enums.dart';
import '../../icons/t_circular_icon.dart';
import '../../price/price_title.dart';
import '../../text/t_brand_title_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () =>Get.to(()=>const ProductDetailScreen(),),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [

            /// thumbnail
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [

                  /// thumbnail image
                  const TRoundedImage(
                    imageUrl: TImages.productImage1, applyIMageRadius: true,),

                  ///  sale- tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),),
                    ),
                  ),

                  ///Favourite Icon Button
                  const Positioned(top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Icons.favorite_sharp, color: Colors.red,)),

                  ///
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),

            /// details
            const Padding(padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: "Green Nike Air Shoes", smallSize: true,),
                  SizedBox(height: TSizes.spaceBtwItems/2,),
                  TBrandTitleWithVerifiedIcon(title: 'Nike'),

                  /// utilise the spcae and keep the bottom text in the bottom

                ],
              ),),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPricetext(price: '35.0',),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(Icons.add, color: TColors.white,))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}








