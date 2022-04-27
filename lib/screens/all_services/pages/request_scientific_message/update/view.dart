import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/availability_message/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/bacis_info/page/drop_down_university_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/view.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFieldToUploadFile.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizerUploadFile.dart';
import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

import '../view.dart';





// ignore: must_be_immutable
class UpdateMessageScreen extends StatefulWidget {
  const UpdateMessageScreen({Key? key}) : super(key: key);

  @override
  State<UpdateMessageScreen> createState() =>
      _UpdateMessageScreenState();
}

class _UpdateMessageScreenState
    extends State<UpdateMessageScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final _firstController = TextEditingController();

  final _secoandController = TextEditingController();

  final _threeController = TextEditingController();

  final _forthController = TextEditingController();

  final _fiveController = TextEditingController();
  final _sixController = TextEditingController();
  final _addCommentController = TextEditingController();

  final _sevenController = TextEditingController();

  bool value = false;


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
            //  margin:ri const EdgeInsets.symmetric(hozontal: 0,vertical: 10),
            height: height,

            width: width,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 22),

              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [

                Row(
                  children: [
                    HeadTopics(title: "DepositScientificThesis".tr,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8,start: 4,end: 4),
                      child: Text(
                          "filesMessageArrow".tr,
                          style: const TextStyle(
                              color: kPrimaryColor, fontSize: 15, fontFamily: 'DinBold'
                          )
                      ),
                    ),

                  ],
                ),
                SizedBox(height: height*0.04,),
                buildContainer(height: height*0.18,title: "fullMessage".tr, controller: _firstController,  onPressed2: (){}),
                buildContainer(height: height*0.18,title: "messagesAddress".tr, controller: _secoandController,  onPressed2: (){}),
                buildContainer(height: height*0.18,title: "topicIndex".tr, controller: _threeController,  onPressed2: (){}),
                buildContainer(height: height*0.18,title: "arabicExtract".tr, controller: _forthController,  onPressed2: (){}),
                buildContainer(height: height*0.18,title: "englishExtract".tr, controller: _fiveController,  onPressed2: (){}),
                buildContainer(height: height*0.18,title: "introduction".tr, controller: _sixController,  onPressed2: (){}),
                buildContainer(height: height*0.18,title: "fullMessage".tr, controller: _sevenController,  onPressed2: (){}),
                buildContainer(height: height*0.18,title: "contentPlus".tr, controller: _sevenController,  onPressed2: (){}),

                SizedBox(height: height*0.04,),
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
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    SmallestButton(
                      onPressed: (){
                       // PutScientificMessage();
                       // Get.to(()=>const RequestVisitScreen())
                      } ,
                      title: "add".tr,
                      color: kPrimaryColor,
                      image: "assets/image/newrequest.png",
                    ),
                    SmallestButton(
                      onPressed: (){
                        // PutScientificMessage();
                        // Get.to(()=>const RequestVisitScreen())
                      } ,
                      title: "more".tr,
                      color: kPrimaryColor,
                      image: "assets/image/newrequest.png",
                    ),
                  ],
                ),

                // SizedBox(
                //   width: width,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       SmallestButton(
                //
                //         onPressed: () {
                //           Get.back();
                //           //  Get.to(()=> MyOrderUpdateMessageScreen());
                //
                //
                //         },
                //         title: "previous".tr,
                //         color: kPrimaryColor,
                //         image: "assets/image/twoarrowleft.png",
                //       ),
                //       SmallestButton(
                //         onPressed: () {
                //
                //           Get.to(()=> MyOrdersScientificMessage());
                //
                //         },
                //         title: "save".tr,
                //         color: kPrimaryColor,
                //         image: "assets/image/rightsah.png",
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );



  }

  Container buildContainer({required double height , required String title ,
    required TextEditingController  controller ,

    required VoidCallback onPressed2,


  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 8),
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
                width: MediaQuery.of(context).size.width /4.00,
                child: Text(title,style:const TextStyle(
                  fontSize: 14,

                  color: kPrimaryColor,
                  fontFamily: "DinBold",
                ),),
              ),
              CustomTextFieldUploadFile(
                controller: controller,
                validator: qValidator([
                  IsRequired("thisFieldRequired".tr),
                  IsOptional(),
                  MaxLength(80),
                ]),
                type: TextInputType.text,
              ),
            ],
          ),
          SmallButtonSizerUploadFile(
            title: "downloadFile".tr,
            onPressed: onPressed2,
            color: kAccentColor,
            image: "assets/image/download.png",
          ),
        ],
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

}
