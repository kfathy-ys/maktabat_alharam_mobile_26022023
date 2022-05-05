
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';


// ignore: must_be_immutable
class FollowReservedRetreatScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final _addCommentController = TextEditingController();


  FollowReservedRetreatScreen({Key? key}) : super(key: key);

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
                  margin:
                      const EdgeInsetsDirectional.only(bottom: 20.0, top: 20.0),
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
                Container(
                  margin:
                      const EdgeInsetsDirectional.only(bottom: 20.0, top: 20.0),
                  height: height * 0.5,
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
                          title: "libraryName".tr,
                          subTitle: "مكتبة الحرم المكي الشريف - رجال",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "phoneNumber".tr,
                          subTitle: "05963214587",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "qualification".tr,
                          subTitle: "طالب ماجستير",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "bookingDate".tr,
                          subTitle: "Mar 22 ,2022",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      buildRow(
                          title: "dateFrom".tr,
                          subTitle: "Mar 31 , 2022",
                          color1: kSmallIconColor,
                          color2: kSkyButton),
                      buildRow(
                          title: "dateTo".tr,
                          subTitle: "Agu 31 , 2022",
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
                  onPressed: () => Get.toNamed("/NewOrderToReserveScientificResearch"),
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
