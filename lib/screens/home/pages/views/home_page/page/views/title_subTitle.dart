// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class TitleSubTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleSubTitle(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.subtTitle})
      : super(key: key);

  final String subtTitle;

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title,
              //  "ourServices".tr,
              style: const TextStyle(
                  color: kSmallIconColor, fontSize: 20, fontFamily: 'DinBold')),
          SizedBox(
            width: width * 0.2,
          ),
          InkWell(
            onTap: onTap,
            child: Text(subtTitle,
                //"allServices".tr,
                style: const TextStyle(
                    color: kSmallIconColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    fontFamily: 'DinLight')),
          ),
        ],
      ),
    );
  }
}
