import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:android_d/features/personalization/screens/address/add_new_address.dart';
import 'package:android_d/features/personalization/screens/address/widgets/single_address.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utlis/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(()=> const AddNewAddressScreen(),),
      backgroundColor: TColors.primary,
        child: const Icon(Icons.add_business,color: TColors.white,),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TSingleAddress(selectedAddress: true),
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: false),
            TSingleAddress(selectedAddress: false),
          ],
        ),
        ),
      ),
    );
  }
}
