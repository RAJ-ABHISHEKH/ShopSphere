import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/custom_shapes/containers/primary_header-container.dart';
import 'package:android_d/common/widgets/images/t_circular_images.dart';
import 'package:android_d/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:android_d/common/widgets/text/section_heading.dart';
import 'package:android_d/features/personalization/screens/address/address.dart';
import 'package:android_d/features/shop/screens/order/order.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utlis/constants/image_strings.dart';
import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// appbar
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: TColors.white,
                          ),
                    ),
                  ),

                  /// user profile card
                  TUserProfileTile(dark: dark,onPressed: ()=>Get.to(()=>const ProfileScreen(),),),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// bosy
             Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const TSectionHeading(title: 'Account settings',showActionButton: false,),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingMenuTile(title: 'My Addresses', subtitle: 'Set shopping delivery address', icon: Icons.home, ontap: () => Get.to(()=> const UserAddressScreen(),),),
                  TSettingMenuTile(title: 'My Cart', subtitle: 'Add, remove products and move to checkout', icon: Icons.shopping_cart, ontap: () {},),
                  TSettingMenuTile(title: 'My Orders', subtitle: 'In-progress and Completed Orders', icon: Icons.shopping_basket, ontap: () =>Get.to(()=>const OrderScreen()),),
                  TSettingMenuTile(title: 'Bank Account', subtitle: 'withdraw balance to registered bank account', icon: Icons.account_balance_outlined, ontap: () {},),
                  TSettingMenuTile(title: 'My Coupons', subtitle: 'List of all the discounted coupons', icon: Icons.local_offer, ontap: () {},),
                  TSettingMenuTile(title: 'Notifications', subtitle: 'Set any kind of notification message', icon: Icons.notifications, ontap: () {},),
                  TSettingMenuTile(title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts', icon: Icons.security, ontap: () {},),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(title: 'App settings',showActionButton: false,),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingMenuTile(title: 'Load Data', subtitle: 'Upload data to your Cloud Firebase', icon: Icons.file_upload, ontap: () {},),
                  TSettingMenuTile(title: 'GeoLocation', subtitle: 'set recommendation  based on location', icon: Icons.my_location_sharp, ontap: () {},trailing: Switch(value: true, onChanged: (value){},),),
                  TSettingMenuTile(title: 'Safe Mode', subtitle: 'Search result is safe for all ages', icon: Icons.verified_user, ontap: () {},trailing: Switch(value: false, onChanged: (value){}),),
                  TSettingMenuTile(title: 'HD Image Quality', subtitle: 'Set image quality to be seen', icon: Icons.image, ontap: () {},trailing: Switch(value: false, onChanged: (value){}),),
                  /// Log out Button
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){},child: const Text("Logout"),),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections*2.5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TSettingMenuTile(title: 'HD Image Quality', subtitle: 'Set image quality to be seen', icon: Icons.image, ontap: () {},trailing: Switch(value: false, onChanged: (value) {}),
