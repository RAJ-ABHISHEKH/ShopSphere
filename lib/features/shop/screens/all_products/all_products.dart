import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/layouts/grid_layout.dart';
import 'package:android_d/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title: Text("Popular Products",style: Theme.of(context).textTheme.headlineSmall),showBackArrow: true,),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TSortableProducts(),
        ),
      ),
    );
  }
}


