import 'package:android_d/utlis/helpers/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }

}