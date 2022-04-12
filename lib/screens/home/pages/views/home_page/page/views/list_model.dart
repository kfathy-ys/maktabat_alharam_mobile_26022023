import 'package:flutter/cupertino.dart';

class OurServicesModel {
  final int id;
  final Widget icon;
  final String title;
  final String subTitle;
  //final VoidCallback onTap;


  OurServicesModel({
  //  required this.onTap,
    required this.id,
    required this.title,
    required this.icon,
    required this.subTitle,
  });
}
