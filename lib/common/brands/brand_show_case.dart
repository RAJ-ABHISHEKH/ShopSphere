import 'package:flutter/material.dart';

import '../../utlis/constants/colors.dart';
import '../../utlis/constants/image_strings.dart';
import '../../utlis/constants/sizes.dart';
import '../widgets/custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.dark, required this.images,
  });

  final bool dark;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin:const  EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brands with product count
          TBrandCard(dark: dark, showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems,),
          /// Brand Top 3 Images
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          ),
        ],
      ),

    );
  }

  Widget brandTopProductImageWidget(String image,context){
    return  Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: dark? TColors.darkerGrey:TColors.light,
        margin: const  EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child:  Image(image: AssetImage(image),fit: BoxFit.contain,),
      ),
    );
  }

}