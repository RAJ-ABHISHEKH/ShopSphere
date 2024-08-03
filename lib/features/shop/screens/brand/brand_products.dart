import 'package:android_d/common/brands/brand_card.dart';
import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/products/sortable/sortable_products.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(title: Text('Nike',style: Theme.of(context).textTheme.headlineSmall,),),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Detail
              TBrandCard(dark: dark, showBorder: true),
              const SizedBox(height: TSizes.spaceBtwSections,),

              const TSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
