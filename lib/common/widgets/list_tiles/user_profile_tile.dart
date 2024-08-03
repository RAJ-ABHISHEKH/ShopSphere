import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/image_strings.dart';
import '../images/t_circular_images.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.dark, required this.onPressed,
  });

  final bool dark;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(dark: dark, image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Raj Abhishekh',style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('rajabhishekbrb075@gmail.com',style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: onPressed,icon:const  Icon(Icons.edit,color: TColors.white,),),
    );
  }
}