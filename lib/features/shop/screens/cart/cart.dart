import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/icons/t_circular_icon.dart';
import 'package:android_d/common/widgets/images/t_rounded_image.dart';
import 'package:android_d/common/widgets/text/product_title_text.dart';
import 'package:android_d/common/widgets/text/t-brand_title-with_verified_icon.dart';
import 'package:android_d/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:android_d/features/shop/screens/checkout/checkout.dart';
import 'package:android_d/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utlis/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// --Items in cart
        child: TCartItems(),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckoutScreen()),child: const Text("Checkout \$256.0"),),
      ),
    );
  }
}




