import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/icons/t_circular_icon.dart';
import 'package:android_d/common/widgets/layouts/grid_layout.dart';
import 'package:android_d/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:android_d/features/shop/screens/home/home.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return  Scaffold(

      appBar: TAppBar(title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
      actions: [
        TCircularIcon(color: dark? TColors.white :TColors.black,icon: Icons.add,onPressed: () => Get.to(const HomeScreen(),) ,
        ),
      ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:Column(
            children: [
              TGridLayout(itemCount: 6, itemBuilder: (_,index) => const TProductCardVertical(),)
            ],
          ) ,
        ),
      ),
      
    );
  }
}
