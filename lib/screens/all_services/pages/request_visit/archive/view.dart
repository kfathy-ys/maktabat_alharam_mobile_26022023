import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/archive/page/views/title.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/my_orders/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/my_order/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../view.dart';





// ignore: must_be_immutable
class ArchiveRequestToVisitScreen extends StatelessWidget{


  final _scaffoldKey = GlobalKey<ScaffoldState>();


  ArchiveRequestToVisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer:  drawer(context: context) ,
          key: _scaffoldKey,
          appBar:customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body:  Container(
            margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            height: height,

            width: width,
            child: ListView(

              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children:  [
                HeadTitle(),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context ,int index){
                    return Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 16.0),
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),

                      height: height*0.33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color:kCardBorder)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRow(
                              title: "nameResponsible".tr,
                              subTitle: "أحمد عبد السلام",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          buildRow(
                              title: "titleOfBook".tr,
                              subTitle: "ASD",
                              color1: kSmallIconColor,
                              color2: kSkyButton),
                          buildRow(
                              title: "requestDate".tr,
                              subTitle: "Mar 23,2022",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          buildRow(
                            title: "orderProcedure".tr,
                            subTitle: "",
                            color1: kBlackText,
                            //  color2: kBlackText
                          ),

                          CustomCardButton(color: kAccentColor,
                            title: "removeFromArchive".tr,
                            onPressed: (){
                            Get.to(()=>MyOrderRequestVisitScreen());
                            },
                            //  icon:  Icons.visibility_outlined
                            image: "assets/image/archieve.png",

                          ),


                        ],
                      ),

                    );
                  },

                ),
                Center(child: SmallButtonSizer(


                  onPressed: (){
                    Get.to(()=>  MyOrderReserveArticleResearch());
                  },
                  title: "addOne".tr,color: kPrimaryColor,
                  image: "assets/image/newrequest.png",))




              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow({required String title ,  String? subTitle , Color? color1 , Color? color2 ,}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16,end: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,        children: [
        Text(
            title,
            //  "محتوي الطلب",
//kSmallIconColor
            style:  TextStyle(
                color: color1, fontSize: 14, fontFamily: 'DinBold'
            )
        ),
        SizedBox(width: 10,),
        Text(

            subTitle!,
            // "هل المكتبة متاحة يوم الجمعة؟",
//kBlackText
            style:  TextStyle(
                color: color2, fontSize: 14, fontFamily: 'DinReguler'
            )
        ),
      ],
      ),
    );
  }
}
