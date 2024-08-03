import 'package:android_d/features/shop/screens/home/home.dart';
import 'package:android_d/features/shop/screens/store/store.dart';
import 'package:android_d/features/shop/screens/wishlist/wishlist.dart';
import 'package:android_d/utlis/constants/colors.dart';
import 'package:android_d/utlis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'features/personalization/screens/settings/settings.dart';
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});


  @override
  Widget build(BuildContext context) {
    final controller=Get.put(NavigationController());
    final darkMode=THelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value=index ,
          backgroundColor: darkMode? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
          NavigationDestination(icon:Icon(Icons.home) , label: "Home"),
          NavigationDestination(icon:Icon(Icons.shop) , label: "Store"),
          NavigationDestination(icon:Icon(Icons.favorite) , label: "Wishlist"),
          NavigationDestination(icon:Icon(Icons.person) , label: "Profile"),
        
        ],),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex=0.obs;

  final screens=[ const HomeScreen(),const StoreScreen(), const FavouriteScreen(),const SettingScreen() ];
}
