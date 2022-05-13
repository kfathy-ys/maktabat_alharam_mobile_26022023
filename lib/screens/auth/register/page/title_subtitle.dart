import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
class TextTitleSubTitle extends StatelessWidget {
  const TextTitleSubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customBoldText(title: "welcome".tr),
        customLightText("createNewAccount".tr)
      ],
    );
  }
}
