import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/auth/forget_password/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
class RecoveryWidget extends StatelessWidget {
  final VoidCallback onTap;

  const RecoveryWidget({Key? key,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsetsDirectional.only(start: 170),
      child: GestureDetector(
        onTap:onTap,
        child: Text(
          "passwordRecovery".tr,

          style: const TextStyle(
              color: kSkyButton, fontSize: 14, fontFamily: 'DinReguler'
          )
          ,),
      ),
    );
  }
}
