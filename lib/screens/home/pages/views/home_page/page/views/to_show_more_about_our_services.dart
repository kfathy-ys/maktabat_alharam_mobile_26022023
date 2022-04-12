import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/auth/login/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
class ToShowMoreAboutOurServices extends StatelessWidget {
  const ToShowMoreAboutOurServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14.0),

          child: Text("toShowEveryServicesMustLogin".tr,

              style:const TextStyle(
                  color: kLightText,
                  fontSize: 14,
                  fontFamily: 'DinMedium')),
        ),
        CustomButton(color: kSafeAreasColor,
          title: "signIn".tr, onPressed: () {
            Get.to(() => LoginScreen());
          },)
      ],
    );
  }
}
