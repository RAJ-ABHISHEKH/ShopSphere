import 'package:android_d/common/widgets/icons/t_circular_icon.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace,vertical: TSizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark? TColors.darkerGrey: TColors.light,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(TSizes.cardRadiusLg),topRight: Radius.circular(TSizes.cardRadiusLg))
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(icon: Icons.remove,backgroundColor: TColors.darkGrey,width: 40,height: 40,color: TColors.white,),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('2',style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: TSizes.spaceBtwItems,),
              const TCircularIcon(icon: Icons.add,backgroundColor: TColors.dark,width: 40,height: 40,color: TColors.white,),
            ],
          ),
          ElevatedButton(onPressed: () {},
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(TSizes.md),
            backgroundColor: TColors.black,
            side: const BorderSide(color: TColors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
