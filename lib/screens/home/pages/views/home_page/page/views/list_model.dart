import 'package:flutter/cupertino.dart';

class OurServicesModel {

  final Widget icon;
  final String title;
  final String subTitle;
  final Widget route;


  OurServicesModel({
    required this.route,
    required this.title,
    required this.icon,
    required this.subTitle,
  });
}
