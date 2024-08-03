import 'package:android_d/utlis/device/device_utility.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utlis/constants/colors.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark? TColors.black : TColors.white,
      child: TabBar(

        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.grey,
        labelColor: dark? TColors.white: TColors.primary,
        tabs: tabs,
        ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
