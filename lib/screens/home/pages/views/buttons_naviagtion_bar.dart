import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ItemsBar{
  List<BottomNavigationBarItem> itemsBar = [
     BottomNavigationBarItem(
      icon: const ImageIcon( AssetImage("assets/image/homeicon.png"),),
      label:"home".tr,
    ),

     BottomNavigationBarItem(

        icon: const ImageIcon( AssetImage("assets/image/homeicon.png"),),
        label: "myOrders".tr,
    ),
     BottomNavigationBarItem(
        icon: const ImageIcon( AssetImage("assets/image/serivesicons.png"),),
        label:  "services".tr),

  ];
}