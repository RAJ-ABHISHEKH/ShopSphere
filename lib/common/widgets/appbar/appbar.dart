import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:android_d/utlis/device/device_utility.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnpressed, });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;
  // final  Color?  backarrowcolor;

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ?  BackButton(color: dark? TColors.white : TColors.dark,)
              // IconButton(onPressed: () => Get.back, icon: const Icon(Icons.arrow_back),color:backarrowcolor ,)
            : leadingIcon!=null? IconButton(onPressed: leadingOnpressed, icon: Icon(leadingIcon)) :null,
        title:title,
        actions: actions,
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(
        TDeviceUtils.getAppBarHeight(),
      );
}
