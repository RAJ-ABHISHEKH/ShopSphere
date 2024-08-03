// import 'dart:ffi';

import 'package:android_d/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:android_d/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:android_d/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:android_d/features/shop/screens/home/widgets/home_categories.dart';
import 'package:android_d/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

// import 'package:android_d/utlis/constants/image_strings.dart';
// import 'package:android_d/utlis/constants/text_strings.dart';
// import 'package:android_d/utlis/device/device_utility.dart';
// import 'package:android_d/utlis/helpers/helper_functions.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/widgets.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header-container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';

// import '../../../../common/widgets/image_text-widgets/vertical_image_text.dart';
// import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utlis/constants/sizes.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// searchbar
                  TSearchContainer(
                    text: "Search in store",
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// --- Categories---
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          textColor: TColors.white,
                          title: 'Popular Categories',
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        /// scrollable categories
                        THomeCategories(),
                        SizedBox(height: TSizes.spaceBtwSections,),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// Body
             Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              /// Promo Slider
              child: Column(
                children: [
                 const  TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ],),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                 /// heading
                  TSectionHeading(title: 'Popular Products',onPressed: () => Get.to(()=> const AllProducts()), ),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                   ///Popular Products
                   TGridLayout(itemCount: 4, itemBuilder: (_,index)=> const TProductCardVertical()),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}




