import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/constants.dart';
class CardNotifications extends StatelessWidget {
  final String title;
  final String date;
  const CardNotifications({Key? key, required this.title, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
      padding:
      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //height: height * 0.1,
      decoration: BoxDecoration(
        color: kBackgroundCardColor,
        borderRadius: BorderRadius.circular(8),
        //  border: Border.all(color: kCardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          AutoSizeText(
            title,
           // " تم إضافة تعليق جديد على طلب خلوة بحثية أو مادة علمية",
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: kBlackText,
              fontSize: 16,
              fontFamily: "DinReguler",
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: AutoSizeText(
               // "السبت 5/2 9:25",
                date,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: kTextFieldColor,
                  fontSize: 14,
                  fontFamily: "DinReguler",
                ),
              ))
        ],
      ),
    );
  }
}
