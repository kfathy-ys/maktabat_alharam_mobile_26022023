import 'package:flutter/cupertino.dart';

class OurServicesModel {
final int id;
  final Widget icon;
  final String title;
  final String subTitle;
  final String routeName;


  OurServicesModel( {
   required this.id,
    required this.routeName,
    required this.title,
    required this.icon,
    required this.subTitle,
  });
}
