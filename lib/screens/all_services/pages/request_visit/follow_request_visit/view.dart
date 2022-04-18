import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';


// ignore: must_be_immutable
class FollowRequestVisitScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _addCommentController = TextEditingController();


  FollowRequestVisitScreen({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  margin:
                      const EdgeInsetsDirectional.only(bottom: 20.0, top: 20.0),
                  height: height * 0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kCardBorder)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildRow(
                          title: "serviceName".tr,
                          subTitle: "خلوة بحثية",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "requiredInstructions".tr,
                          subTitle: " كارنيه الإستشارة",
                          color1: kSmallIconColor,
                          color2: kAccentColor),
                    ],
                  ),
                ),
                HeadTopics(
                  title: "requestData".tr,
                ),
                Container(
                  margin:
                      const EdgeInsetsDirectional.only(bottom: 20.0, top: 20.0),
                  height: height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kCardBorder)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildRow(
                          title: "entityName".tr,
                          subTitle: "مدرسة",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "nameResponsible".tr,
                          subTitle: "Ahmed",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "email".tr,
                          subTitle: "Ahmed78@gmail.com",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "phoneNumber".tr,
                          subTitle: "955542369875",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "visitsNumbers".tr,
                          subTitle: "8",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "visitReason".tr,
                          subTitle: "إستطلاع",
                          color1: kSmallIconColor,
                          color2: kSkyButton),

                    ],
                  ),
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
                  onPressed: () => Get.to(()=>const RequestVisitScreen()),
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
              style: const TextStyle(
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
