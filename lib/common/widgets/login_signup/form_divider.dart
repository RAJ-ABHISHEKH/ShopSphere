import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/helpers/helper_functions.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key, required this.dividertext,

  });

  final String  dividertext;

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark? TColors.darkerGrey: TColors.grey,thickness: 0.5,indent: 60,endIndent: 5,)),
        Text(dividertext, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark? TColors.darkerGrey: TColors.grey,thickness: 0.5,indent: 60,endIndent: 5,)),
      ],
    );
  }
}