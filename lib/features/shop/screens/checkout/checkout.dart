import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:android_d/common/widgets/success_screen/success_screen.dart';
import 'package:android_d/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:android_d/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:android_d/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:android_d/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:android_d/features/shop/screens/home/home.dart';
import 'package:android_d/navigation_menu.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/products/cart/coupon-widget.dart';
import '../../../../utlis/constants/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --Items in Cart
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///--Coupon TextField
              const TCoupleCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// --Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Address
                    TBillingAddressSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() =>  SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: "Payment Success",
              subtitle: "your item will be shipped soon!",
              onPressed: () => Get.to(()=>const NavigationMenu()),
          ),
          ),
          child: const Text("Checkout \$256.0"),
        ),
      ),
    );
  }
}
