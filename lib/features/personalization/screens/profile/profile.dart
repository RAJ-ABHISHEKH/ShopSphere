import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/images/t_circular_images.dart';
import 'package:android_d/common/widgets/text/section_heading.dart';
import 'package:android_d/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return  Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium!.apply(
            color:dark? TColors.white : TColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  TCircularImage(dark: dark, image: TImages.user,width: 80,height: 80,),
                  TextButton(onPressed: (){} , child: const Text("change profile picture"),),
                ],
              ),
            ),

            /// details
            const SizedBox(height: TSizes.spaceBtwSections/2,),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
            const TSectionHeading(title: 'Profile Information',showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            TProfileMenu(onPressed: () {}, title: 'Name', value: 'Raj Abhishekh',),
            TProfileMenu(onPressed: () {}, title: 'UserName', value: 'Raj_abhishek',),
            const SizedBox(height: TSizes.spaceBtwSections,),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
            const TSectionHeading(title: 'Personal Information',showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            TProfileMenu(onPressed: () {}, title: 'UserId', value: '45689',icon: Icons.copy,),
            TProfileMenu(onPressed: () {}, title: 'Email', value: 'rajabhishekbrb075@gmail.com',),
            TProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+91 9508345778',),
            TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male',),
            TProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '9 oct 2004',),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
            
            Center(
              child: TextButton(
                onPressed: (){},
                child: const Text('Delete Account',style: TextStyle(color: Colors.red),),
              ),
            )
          ],
        ),
        ),

      ),
    );
  }
}


