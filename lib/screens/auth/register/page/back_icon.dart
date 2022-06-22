import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconBack extends StatelessWidget {
  const IconBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 280),
        child: Image.asset("assets/image/backbutton.png"),
      ),
    );
  }
}
