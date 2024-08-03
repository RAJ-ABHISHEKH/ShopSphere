import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/images/t_rounded_image.dart';
import 'package:android_d/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:android_d/common/widgets/text/section_heading.dart';
import 'package:android_d/utlis/constants/image_strings.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: const TAppBar(title: Text("Sports"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
            const TRoundedImage(imageUrl: TImages.promoBanner3,applyIMageRadius: true,width: double.infinity,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// sub -Categories
            Column(
              children: [
                TSectionHeading(title: "Sports shirts",onPressed: (){},),
                const SizedBox(height: TSizes.spaceBtwItems/2,),

              SizedBox(
                height: 120,
                child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index)=> const SizedBox(width: TSizes.spaceBtwItems,),
                    itemBuilder:(context, index) => const TProductCardHorizontal()),
              )
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
