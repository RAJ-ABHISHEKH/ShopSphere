import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/appbar/tabbar.dart';
import 'package:android_d/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:android_d/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:android_d/common/widgets/layouts/grid_layout.dart';
import 'package:android_d/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:android_d/common/widgets/text/section_heading.dart';
import 'package:android_d/features/shop/screens/brand/all_brands.dart';
import 'package:android_d/features/shop/screens/store/widgets/category_tab.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/enums.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/brands/brand_card.dart';
import '../../../../common/brands/brand_show_case.dart';
import '../../../../common/widgets/images/t_circular_images.dart';
import '../../../../common/widgets/text/t-brand_title-with_verified_icon.dart';
import '../../../../utlis/constants/image_strings.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: dark ? TColors.white : TColors.primary,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                // it means the app bar not going to move when the design is going to moving or is moving
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const TSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Features Brands
                      TSectionHeading(
                        title: "Featured Brands",
                        showActionButton: true,
                        onPressed: () =>Get.to(()=> const AllBrandScreen()),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      /// Grid
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 88,
                        itemBuilder: (_, index) {
                          return TBrandCard(
                            dark: dark,
                            showBorder: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                /// Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Furniture'),
                    ),
                    Tab(
                      child: Text('Electronics'),
                    ),
                    Tab(
                      child: Text('Clothes'),
                    ),
                    Tab(
                      child: Text('Cosmetics'),
                    ),
                  ],
                ),
              )
            ];
          },

          /// body
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
