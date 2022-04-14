import 'package:flutter/cupertino.dart';

class OurServicesModel {

  final Widget icon;
  final String title;
  final String subTitle;
  final String routeName;


  OurServicesModel({
    required this.routeName,
    required this.title,
    required this.icon,
    required this.subTitle,
  });
}
