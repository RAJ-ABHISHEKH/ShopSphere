import 'package:flutter/material.dart';

import '../../../../../utlis/constants/sizes.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Rating
        Row(
          children: [
            const Icon(Icons.star_border_purple500,color: Colors.amber,size: 24,),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: '5.0',style: Theme.of(context).textTheme.bodyLarge),
                    const TextSpan(text: '(199)'),
                  ]
              ),
            ),
          ],
        ),
        /// share Button
        IconButton(onPressed: (){}, icon: Icon(Icons.share,size: TSizes.iconMd,),),
      ],
    );
  }
}