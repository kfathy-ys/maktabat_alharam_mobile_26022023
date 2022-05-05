import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/page/head_topices.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
class HeadTitle extends StatelessWidget {
  const HeadTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
   // double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            HeadTopics(title: "askStaff".tr,),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8,start: 4,end: 4),
              child: Text(
                  "kArchive".tr,
                  style: const TextStyle(
                      color: kPrimaryColor, fontSize: 15, fontFamily: 'DinBold'
                  )
              ),
            ),

          ],
        ),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 18),
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical:6),
          height: height*0.24,
          decoration: BoxDecoration(
              color: kBackgroundCardColor,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text(
              "titleMessage".tr,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: kBlackText, fontSize: 18, fontFamily: 'DinReguler'
              )
          ),
        ),
      ],
    );
  }
}
