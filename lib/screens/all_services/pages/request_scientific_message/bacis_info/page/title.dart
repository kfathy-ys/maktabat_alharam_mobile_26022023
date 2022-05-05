import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/page/head_topices.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
// ignore: must_be_immutable
class HeadTitle extends StatelessWidget {
  final String title;
  final String subTitle;


   const HeadTitle({Key? key,required this.title,required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  double height = MediaQuery.of(context).size.height;
  //  double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            HeadTopics(title:title
           // "DepositScientificThesis".tr,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8,start: 8,end: 4),
              child: Text(
                 // "basicInfoArrow".tr,
                subTitle,
                  style: const TextStyle(
                      color: kPrimaryColor, fontSize: 15, fontFamily: 'DinBold'
                  )
              ),
            ),

          ],
        ),


      ],
    );
  }
}
