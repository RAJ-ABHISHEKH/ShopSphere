import 'package:android_d/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __)=> const SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder:(_,index) => TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Row-1
            Row(
              children: [
                ///1- Icon
                const Icon(Icons.local_shipping),
                const SizedBox(width: TSizes.spaceBtwItems/2,),

                /// 2-status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Processing",style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),),
                      Text("07 Nov 2025",style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ),

                ///3-Icon
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,size: TSizes.iconSm,)),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwItems,),

            /// --Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///1- Icon
                      const Icon(Icons.discount_outlined),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),

                      /// 2-status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order",style: Theme.of(context).textTheme.labelMedium,),
                            Text("[#256f2]",style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ///1- Icon
                      const Icon(Icons.calendar_month),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),

                      /// 2-status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date",style: Theme.of(context).textTheme.labelMedium,),
                            Text("03 Feb 2025",style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
