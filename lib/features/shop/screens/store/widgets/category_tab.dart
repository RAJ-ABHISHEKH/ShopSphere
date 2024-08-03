import 'package:android_d/common/widgets/layouts/grid_layout.dart';
import 'package:android_d/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:android_d/common/widgets/text/section_heading.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/brands/brand_show_case.dart';
import '../../../../../utlis/constants/image_strings.dart';
import '../../../../../utlis/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return ListView(
      shrinkWrap: true,
      physics:const  NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// ----Brands
            TBrandShowcase(dark: dark, images: const [TImages.productImage3,TImages.productImage2,TImages.productImage1],),
            const SizedBox(height: TSizes.spaceBtwItems,),
            /// -- Products
            TSectionHeading(title: 'You might like',showActionButton: true,onPressed: (){},),
            const SizedBox(height: TSizes.spaceBtwItems,),

            TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const TProductCardVertical(),),
          ],
        ),
      ),
    ],
    );
  }
}
