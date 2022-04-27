import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/archive/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/follow_request_visit/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/update_order/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../view.dart';





// ignore: must_be_immutable
class MyOrderRequestVisitScreen extends StatelessWidget{


  final _scaffoldKey = GlobalKey<ScaffoldState>();


  MyOrderRequestVisitScreen({Key? key}) : super(key: key);

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
                HeadTopics(title: "RequestVisit".tr,),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical:6),
                  height: height*0.15,
                  decoration: BoxDecoration(
                      color: kBackgroundCardColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(
                      "titleHead".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: kBlackText, fontSize: 18, fontFamily: 'DinReguler'
                      )
                  ),
                ),
                Center(child: SmallButtonSizer(


                  onPressed: (){
                    Get.to(()=> RequestVisitScreen());
                  },
                  title: "addOne".tr,color: kPrimaryColor,
                  image: "assets/image/newrequest.png",)),
                SizedBox(height: height*0.03,),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context ,int index){
                    return Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 16.0),

                      height: height*0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color:kCardBorder)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRow(
                              title: "nameRequest".tr,
                              subTitle: "هل المكتبة متاحة يوم الجمعة؟",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          buildRow(
                              title: "nameResponsible".tr,
                              subTitle: "أحمد عبد السلام",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          buildRow(
                              title: "requestDate".tr,
                              subTitle: "Mar 31 , 2022",
                              color1: kSmallIconColor,
                              color2: kSkyButton),
                          buildRow(
                              title: "requestState".tr,
                              subTitle: "نعم",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          buildRow(
                            title: "orderProcedure".tr,
                            subTitle: "",
                            color1: kBlackText,
                            //  color2: kBlackText
                          ),
                          CustomCardButton(color: kAccentColor,
                            title: "followRequest".tr,
                            onPressed: ()=>Get.to(()=>FollowRequestVisitScreen()),
                            //  icon:  Icons.visibility_outlined
                            image: "assets/image/fulleyes.png",

                          ),
                          CustomCardButton(color: kAccentColor,
                            title: "updateRequest".tr,
                            onPressed: ()=>Get.to(()=>const UpdateOrderOfVisitRequest()),
                            //  icon:  Icons.visibility_outlined
                            image: "assets/image/update.png",

                          ),
                          CustomCardButton(color: kAccentColor,
                            title: "addToArchive".tr,
                            onPressed: ()=>Get.to(()=> ArchiveRequestToVisitScreen()),

                            image: "assets/image/archieve.png",
                            //  icon:Icons.cancel_outlined
                          ),

                        ],
                      ),

                    );
                  },

                ),





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
