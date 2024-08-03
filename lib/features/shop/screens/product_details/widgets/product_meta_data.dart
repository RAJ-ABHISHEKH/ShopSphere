import 'package:android_d/common/widgets/images/t_circular_images.dart';
import 'package:android_d/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:android_d/common/widgets/text/product_title_text.dart';
import 'package:android_d/common/widgets/text/t-brand_title-with_verified_icon.dart';
import 'package:android_d/utlis/constants/enums.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utlis/constants/colors.dart';
import '../../../../../utlis/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, });




  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            /// Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            const TProductPriceText(Price: '175',isLarge: true,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        /// Title
        const TProductTitleText(title: 'Green Nike Sports Shirt',),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        /// Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status',),
            const SizedBox(width:  TSizes.spaceBtwItems,),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        /// Brand
        Row(
          children: [
            TCircularImage(dark: dark, image: TImages.cosmeticsIcon,width: 32,height: 32,
            overlayColor: dark? TColors.white : TColors.black,),
            const TBrandTitleWithVerifiedIcon(title: 'Nike',brandTextSizes: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}


class TProductPriceText extends StatelessWidget {
  const TProductPriceText({super.key, this.currencySign = '\$', required this.Price,  this.maxLines = 1,  this.lineThrough = false,  this.isLarge = false,});

  final String currencySign , Price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign +Price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough? TextDecoration.lineThrough: null) :
          Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
