
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/message_files/view.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/selector_opinion.dart';
import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';





enum Opinion { yes, no }


// ignore: must_be_immutable
class AvailabilityMessageScreen extends StatefulWidget {


   const AvailabilityMessageScreen({Key? key}) : super(key: key);

  @override
  State<AvailabilityMessageScreen> createState() =>
      _AvailabilityMessageScreenState();
}

class _AvailabilityMessageScreenState
    extends State<AvailabilityMessageScreen> {


  final formKey = GlobalKey<FormState>();

  Opinion? _opinion;




  @override
  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: drawer(context: context),
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              context: context),
          body: SizedBox(
            //  margin:ri const EdgeInsets.symmetric(hozontal: 0,vertical: 10),
            height: height,

            width: width,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 22),

              physics: const BouncingScrollPhysics(),
              //  shrinkWrap: true,
              children: [

                Row(
                  children: [
                    HeadTopics(title: "DepositScientificThesis".tr,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8,start: 4,end: 4),
                      child: Text(
                          "availabilityMessageArrow".tr,
                          style: const TextStyle(
                              color: kPrimaryColor, fontSize: 15, fontFamily: 'DinBold'
                          )
                      ),
                    ),

                  ],
                ),
                SizedBox(height: height*0.04,),
                const SelectorOpenion(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmallestButton(

                      onPressed: () {
                        Get.back();
                        //  Get.to(()=> MyOrderAvailabilityMessageScreen());


                      },
                      title: "previous".tr,
                      color: kPrimaryColor,
                      image: "assets/image/twoarrowleft.png",
                    ),
                    SmallestButton(

                      onPressed: () {

                      Get.to(()=> const MessageFilesScreen());

                      },
                      title: "next".tr,
                      color: kPrimaryColor,
                      image: "assets/image/twoarrowright.png",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );



  }

  ListTile buildListTile({required Color color ,  required String title , required String image}) {
    return ListTile(
      horizontalTitleGap: 1,
      //"fillOut".tr
      title: Text(title, style:  TextStyle(
          color: color, fontSize: 14, fontFamily: 'DinReguler'
      )),
      //"assets/image/dot.png"
      leading:Image.asset(image),

    );
  }

  Padding buildPadding({required String title}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 40),
      child: Text(
        title,
        style: const TextStyle(
          color: kBlackText,
          fontSize: 16,
          fontFamily: "DinReguler",
        ),
      ),
    );
  }

  Row buildRow({
    required String title,
    String? subTitle,
    Color? color1,
    Color? color2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(title,
            //  "محتوي الطلب",
//kSmallIconColor
            style:
            TextStyle(color: color1, fontSize: 14, fontFamily: 'DinBold')),
        Text(subTitle!,
            // "هل المكتبة متاحة يوم الجمعة؟",
//kBlackText
            style: TextStyle(
                color: color2, fontSize: 14, fontFamily: 'DinReguler')),
      ],
    );
  }


}
