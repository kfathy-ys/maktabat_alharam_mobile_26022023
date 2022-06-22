import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class HeadTopics extends StatelessWidget {
  final String title;
  const HeadTopics({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: kBlackText, fontSize: 20, fontFamily: 'DinBold')),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8.0),
            child: Image.asset("assets/image/dividerAccent.png"),
          )

          //customSliderText(title: "askLibrarian".tr, color: kBlackText)
        ],
      ),
    );
  }
}
