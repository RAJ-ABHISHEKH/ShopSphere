import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../utlis/constants/sizes.dart';
import '../../product_details/widgets/product_meta_data.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,  this.showAddRemoveButtons = true});
 final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if(showAddRemoveButtons)  const SizedBox(height: TSizes.spaceBtwItems,),

          /// Add Remove Button Row with total Price
            if(showAddRemoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(

                children: [
                  /// Extra Space
                  SizedBox(width: 70,),
                  /// add remove buttons
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(Price: "256"),

            ],
          )
        ],
      ),
    );
  }
}
