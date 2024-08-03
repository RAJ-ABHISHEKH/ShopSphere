import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(showBackArrow: true,title: Text("Add New Address"),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(child: Column(children: [
          TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.person),labelText: 'Name'),),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
          TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.phone),labelText: 'Phone Number'),),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
          Row(
            children: [
              Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.apartment),labelText: 'Street'),)),
              const SizedBox(width: TSizes.spaceBtwInputFields,),
              Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.code),labelText: 'Street'),)),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
          Row(
            children: [
              Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.location_city),labelText: 'City'),)),
              const SizedBox(width: TSizes.spaceBtwInputFields,),
              Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.local_activity),labelText: 'State'),)),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
           TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Icons.public),labelText: 'State'),),
          const SizedBox(height: TSizes.defaultSpace,),
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){},child: const Text("Save"),),)
        ],
        ),
        ),
        ),
      ),
    );
  }
}
