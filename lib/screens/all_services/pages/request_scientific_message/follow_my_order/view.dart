import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizerUploadFile.dart';


// ignore: must_be_immutable
class FollowScientificMessage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _addCommentController = TextEditingController();


  FollowScientificMessage({Key? key}) : super(key: key);

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
          key: _scaffoldKey,
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            height: height,
            width: width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                HeadTopics(
                  title: "orderFollowUp".tr,
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(top: 10),
                  margin: const EdgeInsetsDirectional.only(bottom: 20.0, top: 20.0),
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kCardBorder)),
                  child: buildRow(
                      title: "serviceName".tr,
                      subTitle: "خلوة بحثية",
                      color1: kSmallIconColor,
                      color2: kBlackText),
                ),
                HeadTopics(
                  title: "requestData".tr,
                ),
                SizedBox(height: height*0.02,),
                ListView(

                  physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                  children: [
                    buildContainer( width: width*0.3,height: height*0.1,title: "fullMessage".tr, onPressed1: (){}, ),
                    buildContainer( width: width*0.3,height: height*0.1,title: "messagesAddress".tr, onPressed1: (){}, ),
                    buildContainer( width: width*0.3,height: height*0.1,title: "topicIndex".tr, onPressed1: (){}, ),
                    buildContainer( width: width*0.3,height: height*0.1,title: "arabicExtract".tr, onPressed1: (){}, ),
                    buildContainer( width: width*0.3,height: height*0.1,title: "englishExtract".tr, onPressed1: (){}, ),
                    buildContainer( width: width*0.3,height: height*0.1,title: "introduction".tr, onPressed1: (){}, ),
                    buildContainer( width: width*0.3,height: height*0.1,title: "fullMessage".tr, onPressed1: (){}, ),
                    buildContainer( width: width*0.3,height: height*0.1,title: "contentPlus".tr, onPressed1: (){}, ),

                  ],
                ),
                HeadTopics(
                  title: "orderEvents".tr,
                ),
                Container(
                  margin:
                  const EdgeInsetsDirectional.only(bottom: 20.0, top: 20.0),
                  height: height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kCardBorder)),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildRequestEvent(
                          title: "requestState".tr,
                          subTitle: "Mar 22,2022",
                          subTitle2: "تم تاكيد الطلب ",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRequestEvent(
                          title: "requestState".tr,
                          subTitle: "Mar 23,2022",
                          subTitle2: "الطلب قيد المراجعة",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRequestEvent(
                          title: "requestState".tr,
                          subTitle: "Mar 26,2022",
                          subTitle2: "تم الموافقة",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                    ],
                  ),
                ),
                HeadTopics(
                  title: "commentsRequest".tr,
                ),
                Container(
                  margin:
                  const EdgeInsetsDirectional.only(bottom: 20.0, top: 20.0),
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    color: kBackgroundCardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildRow(
                          title: "Ahmed",
                          subTitle: "Mar 22,2022  7:54 PM",
                          color1: kBlackText,
                          color2: kAccentColor),
                      buildRow(
                          title: "هل يمكن إستخراج البطاقة المدرسية؟",
                          subTitle: "",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                    ],
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsetsDirectional.only(bottom: 20.0, top: 20.0),
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    color: kBackgroundCardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildRow(
                          title: "EMP",
                          subTitle: "Mar 22,2022  8:04 PM",
                          color1: kBlackText,
                          color2: kAccentColor),
                      buildRow(
                          title: "لا , لا يمكن !",
                          subTitle: "",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                    ],
                  ),
                ),
                CustomTextField(
                  controller: _addCommentController,
                  hint: "أضف تعليق",
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                    child: SmallButtonSizer(
                      onPressed: () => Get.to(()=>PutScientificMessage()),
                      title: "add".tr,
                      color: kPrimaryColor,
                      image: "assets/image/newrequest.png",
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer({required double height ,required double width , required String title ,

    required VoidCallback onPressed1,



  }) {
    return Container(

      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kCardBorder)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width,
                child: SizedBox(
                  width: width*0.2,
                  child: Text(title,style:const TextStyle(
                    fontSize: 14,

                    color: kPrimaryColor,
                    fontFamily: "DinBold",
                  ),),
                ),
              ),
              SmallButtonSizerUploadFile(
                title: "downloadFile".tr,
                onPressed: onPressed1,
                color: kAccentColor,
                image: "assets/image/download.png",
              ),

            ],
          ),

        ],
      ),
    );
  }
  Widget buildRequestEvent({
    required String title,
    String? subTitle2,
    String? subTitle,
    Color? color1,
    Color? color2,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: color1, fontSize: 14, fontFamily: 'DinBold')),
          Text(subTitle2!,
              style: TextStyle(
                  color: color2, fontSize: 14, fontFamily: 'DinReguler')),
          Text(subTitle!,
              style: TextStyle(
                  color: kAccentColor, fontSize: 14, fontFamily: 'DinReguler')),
        ],
      ),
    );
  }

  Widget buildRow({
    required String title,
    String? subTitle,
    Color? color1,
    Color? color2,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: color1, fontSize: 14, fontFamily: 'DinBold')),
          Text(subTitle!,
              style: TextStyle(
                  color: color2, fontSize: 14, fontFamily: 'DinReguler')),
        ],
      ),
    );
  }
}
