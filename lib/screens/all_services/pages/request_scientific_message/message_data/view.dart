import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/availability_message/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/bacis_info/page/drop_down_university_name.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

// ignore: must_be_immutable
class MessageDataScreen extends StatefulWidget {
  const MessageDataScreen({Key? key}) : super(key: key);

  @override
  State<MessageDataScreen> createState() =>
      _MessageDataScreenState();
}

class _MessageDataScreenState
    extends State<MessageDataScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();


  final _emailController = TextEditingController();

  final _uniController = TextEditingController();

  final _dataMessageController = TextEditingController();

  final _phoneController = TextEditingController();

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
              //  shrinkWrap: true,
              children: [

                Row(
                  children: [
                    HeadTopics(title: "DepositScientificThesis".tr,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8,start: 4,end: 4),
                      child: Text(
                          "basicDataArrow".tr,
                          style: const TextStyle(
                              color: kPrimaryColor, fontSize: 15, fontFamily: 'DinBold'
                          )
                      ),
                    ),

                  ],
                ),
                SizedBox(height: height*0.04,),
                CustomTextField(
                  hint: "thesisData".tr,
                  dIcon: Icons.message,
                  label: "thesisData".tr,
                  controller: _dataMessageController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  hint: "messageAddress".tr,
                  dIcon: Icons.add_circle_outline,
                  label: "messageAddress".tr,
                  controller: _uniController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  hint: "degree".tr,
                  dIcon: Icons.email,
                  label: "degree".tr,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),

                CustomTextField(
                  hint: "yearOfDiscussion".tr,
                  dIcon: Icons.youtube_searched_for_outlined,
                  label: "yearOfDiscussion".tr,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
                ),
                CustomTextField(
                  hint: "pagesNumbers".tr,
                  dIcon: Icons.confirmation_number_outlined,
                  label: "pagesNumbers".tr,
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
                ),
                CustomTextField(
                  hint: "numbersOfParts".tr,
                  dIcon: Icons.apartment_sharp,
                  label: "numbersOfParts".tr,
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.phone,
                ),
                SizedBox(height: height*0.04,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmallestButton(

                      onPressed: () {
                        Get.back();
                        //  Get.to(()=> MyOrderMessageDataScreen());


                      },
                      title: "previous".tr,
                      color: kPrimaryColor,
                      image: "assets/image/twoarrowleft.png",
                    ),
                    SmallestButton(

                      onPressed: () {

                         Get.to(()=> AvailabilityMessageScreen());

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



  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
