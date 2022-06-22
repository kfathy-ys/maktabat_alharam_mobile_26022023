import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class SubHeadTitle extends StatelessWidget {
  const SubHeadTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 45, bottom: 20, top: 20),
      child: const Text(
          "ناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز",
          style: TextStyle(
              color: kBlackText, fontSize: 16, fontFamily: 'DinLight')),
    );
  }
}
