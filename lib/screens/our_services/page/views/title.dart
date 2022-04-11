import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
class HeadTitle extends StatelessWidget {
  const HeadTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text( "ourServices".tr,
        style:const TextStyle(
            color: kBlackText,
            fontSize: 22,
            fontFamily: 'DinBold'));
  }
}
