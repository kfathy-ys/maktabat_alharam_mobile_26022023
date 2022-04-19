import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/mediaButton.dart';
import 'package:maktabat_alharam/screens/widgets/smallButton.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:queen/validation/it/is_email.dart';
import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

import 'page/views/drop_down_items.dart';


// ignore: must_be_immutable
class MyOrderAskLibrarian extends StatelessWidget{
  MyOrderAskLibrarian({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();


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
              // shrinkWrap: true,
              children:  [
                HeadTopics(title: "askStaff".tr,),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical:6),
                  height: height*0.24,
                  decoration: BoxDecoration(
                      color: kBackgroundCardColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(
                      "head".tr,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: kBlackText, fontSize: 18, fontFamily: 'DinReguler'
                      )
                  ),
                ),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context ,int index){
                    return Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 16.0),
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),

                      height: height*0.42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color:kCardBorder)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRow(
                              title: "requestContent".tr,
                              subTitle: "المكتبة متاحة يوم الجمعة؟",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          buildRow(
                              title: "requestDate".tr,
                              subTitle: " Mar 31 , 2022",
                              color1: kSmallIconColor,
                              color2: kSkyButton),
                          buildRow(
                              title: "nameResponsible".tr,
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
                            onPressed: ()=>Get.to(()=>FollowAnsweringLibrarian()),
                            //  icon:  Icons.visibility_outlined
                            image: "assets/image/fulleyes.png",

                          ),

                          CustomCardButton(color: kAccentColor,
                            title: "cancelRequest".tr,
                            onPressed: (){},
                            image: "assets/image/fullerror.png",
                            //  icon:Icons.cancel_outlined
                          ),

                        ],
                      ),

                    );
                  },

                ),
                Center(child: SmallButtonSizer(


                  onPressed: ()=>
                      Get.to(()=>AskLibrarian()),
                  title: "addOne".tr,color: kPrimaryColor,image: "assets/image/newrequest.png",))




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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,

              style:  TextStyle(
                  color: color1, fontSize: 14, fontFamily: 'DinBold'
              )
          ),
          SizedBox(width: 10,),
          Text(

              subTitle!,

              style:  TextStyle(
                  color: color2, fontSize: 14, fontFamily: 'DinReguler'
              )
          ),
        ],
      ),
    );
  }

}
