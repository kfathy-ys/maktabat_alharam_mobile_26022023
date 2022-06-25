import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/availability_message/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/bacis_info/page/title.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';
import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

import '../message_files/cubit/messages_input.dart';

class MessageDataScreen extends StatefulWidget {
  MessagesFilesInputData filesInputData;
   MessageDataScreen(this.filesInputData,{Key? key}) : super(key: key);

  @override
  State<MessageDataScreen> createState() => _MessageDataScreenState();
}

class _MessageDataScreenState extends State<MessageDataScreen> {
  final formKey = GlobalKey<FormState>();

  final _messageAddressController = TextEditingController();

  final _degreeController = TextEditingController();

  final _yearOfDiscussionController = TextEditingController();

  final _dataMessageController = TextEditingController();

  final _pagesNumbersController = TextEditingController();
  final _numbersOfPartsController = TextEditingController();
  MessagesFilesInputData filesInputData = MessagesFilesInputData();
@override
  void initState() {
  filesInputData = widget.filesInputData;

print(filesInputData.toJson());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      appBar: customAppbar(
          icons: Icons.arrow_forward_outlined, isIcons: true, context: context),
      body: Form(
        key: formKey,
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(

              children: [
                HeadTitle(
                  title: "DepositScientificThesis".tr,
                  subTitle: "basicDataArrow".tr,
                ),
                buildSizedBox(height),
                CustomTextField(
                  hint: "thesisData".tr,
                  dIcon: Icons.message,
                  label: "thesisData".tr,
                  controller: _dataMessageController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                  onsave: (String? value) {
                    filesInputData.thesisData = value;
                  },
                ),
                CustomTextField(
                  hint: "messageAddress".tr,
                  dIcon: Icons.add_circle_outline,
                  label: "messageAddress".tr,
                  controller: _messageAddressController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                  onsave: (String? value) {
                    filesInputData.thesisTitle = value;
                  },
                ),
                CustomTextField(
                  hint: "degree".tr,
                  dIcon: Icons.email,
                  label: "degree".tr,
                  controller: _degreeController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                  onsave: (String? value) {
                    filesInputData.scientificDegree = value;
                  },
                ),
                CustomTextField(
                  hint: "yearOfDiscussion".tr,
                  dIcon: Icons.youtube_searched_for_outlined,
                  label: "yearOfDiscussion".tr,
                  controller: _yearOfDiscussionController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
                  onsave: (String? value) {
                    filesInputData.yearOfDiscussion = value ;
                  },
                ),
                CustomTextField(
                  hint: "pagesNumbers".tr,
                  dIcon: Icons.confirmation_number_outlined,
                  label: "pagesNumbers".tr,
                  controller: _pagesNumbersController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),

                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
                  onsave: (String? value) {
                    filesInputData.numberOfPages = value ;
                  },
                ),
                CustomTextField(
                  hint: "numbersOfParts".tr,
                  dIcon: Icons.apartment_sharp,
                  label: "numbersOfParts".tr,
                  controller: _numbersOfPartsController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),

                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
                  onsave: (String? value) {
                    filesInputData.numberOfParts = value;
                  },
                ),
                buildSizedBox(height),
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
                        if(formKey.currentState!.validate()){
                          Get.to(() =>  AvailabilityMessageScreen(filesInputData));
                        }

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

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.04,
      );
}
