import 'package:android_d/common/widgets/appbar/appbar.dart';
import 'package:android_d/features/shop/screens/order/widgets/order_list_items.dart';
import 'package:android_d/utlis/constants/sizes.dart';
import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall,),),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        child: TOrderListItems(),
      ),
    );
  }
}
