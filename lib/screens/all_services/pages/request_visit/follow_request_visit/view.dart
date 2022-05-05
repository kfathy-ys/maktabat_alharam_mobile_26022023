
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import 'page/views/request_events.dart';


// ignore: must_be_immutable
class FollowRequestVisitScreen extends StatelessWidget {
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
                      CardData(
                          title: "serviceName".tr,
                          subTitle: "خلوة بحثية",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      CardData(
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
                      CardData(
                          title: "entityName".tr,
                          subTitle: "مدرسة",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      CardData(
                          title: "nameResponsible".tr,
                          subTitle: "Ahmed",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      CardData(
                          title: "email".tr,
                          subTitle: "Ahmed78@gmail.com",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      CardData(
                          title: "phoneNumber".tr,
                          subTitle: "955542369875",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      CardData(
                          title: "visitsNumbers".tr,
                          subTitle: "8",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      CardData(
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
                      RequestEvents(
                          title: "requestState".tr,
                          subTitle: "Mar 22,2022",
                          subTitle2: "تم تاكيد الطلب ",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      RequestEvents(
                          title: "requestState".tr,
                          subTitle: "Mar 23,2022",
                          subTitle2: "الطلب قيد المراجعة",
                          color1: kSmallIconColor,
                          color2: kBlackText),
                      RequestEvents(
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
                    children: const [
                      CardData(
                          title: "Ahmed",
                          subTitle: "Mar 22,2022  7:54 PM",
                          color1: kBlackText,
                          color2: kAccentColor),
                      CardData(
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
                    children: const [
                      CardData(
                          title: "EMP",
                          subTitle: "Mar 22,2022  8:04 PM",
                          color1: kBlackText,
                          color2: kAccentColor),
                      CardData(
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




}
