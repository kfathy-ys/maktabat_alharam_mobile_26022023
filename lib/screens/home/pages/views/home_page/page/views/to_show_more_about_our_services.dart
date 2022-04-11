import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
class ToShowMoreAboutOurServices extends StatelessWidget {
  const ToShowMoreAboutOurServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0),

        child: Text("toShowEveryServicesMustLogin".tr,

            style:const TextStyle(
                color: kLightText,
                fontSize: 14,
                fontFamily: 'DinMedium')),
      ),
    );
  }
}
