import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/message_files/view.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/alerts.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/selector_opinion.dart';
import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';

import '../message_files/cubit/messages_input.dart';

// ignore: must_be_immutable
class AvailabilityMessageScreen extends StatefulWidget {
  MessagesFilesInputData filesInputData;

  AvailabilityMessageScreen(this.filesInputData, {Key? key}) : super(key: key);

  @override
  State<AvailabilityMessageScreen> createState() =>
      _AvailabilityMessageScreenState();
}

class _AvailabilityMessageScreenState extends State<AvailabilityMessageScreen> {
  final formKey = GlobalKey<FormState>();
  MessagesFilesInputData filesInputData = MessagesFilesInputData();

  //Opinion? _opinion;
  String _selectedOption = "";

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
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  HeadTopics(
                    title: "DepositScientificThesis".tr,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        bottom: 8, start: 4, end: 4),
                    child: Text("availabilityMessageArrow".tr,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: 'DinBold')),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SelectorOpenion(
                onChange: (value) {

                    _selectedOption = value;
                    print(value.toString());

                  if (value == "noOption") {
                    filesInputData.isAvailable =false;
                    filesInputData.availabilityType =false;
                    filesInputData.isAvailableWithChains =false;
                    onMessageSubmitFalse();
                  }
                  if (value == "firstAvailabilitySelected") {
                    filesInputData.isAvailable =true;
                    filesInputData.availabilityType =false;
                    filesInputData.isAvailableWithChains =false;
                    onFirstAvailabilitySubmitTrue();
                  }

                  if (value == "secondAvailabilitySelectedWithFirstOption") {
                    filesInputData.isAvailableWithChains =true;
                    filesInputData.availabilityType =true;
                    onSecondAvailabilitySubmitFirst();
                  }
                  if (value == "secondAvailabilitySelectedWithSecondOption") {
                    filesInputData.isAvailableWithChains =true;
                    filesInputData.availabilityType =true;
                    onSecondAvailabilitySubmitSecond();
                  }
                  if (value == "secondAvailabilitySelectedWithThirdOption") {
                    filesInputData.isAvailableWithChains =true;
                    filesInputData.availabilityType =true;
                    onSecondAvailabilitySubmitThird();
                  }
                  if (value == "secondAvailabilitySelectedWithFourthOption") {
                    filesInputData.isAvailableWithChains =true;
                    filesInputData.availabilityType =true;
                    onSecondAvailabilitySubmitFourth();
                  }
                  setState(() {

                  });
                  print(filesInputData.toJson());

                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmallestButton(
                    onPressed: () {
                      Get.back();
                    },
                    title: "previous".tr,
                    color: kPrimaryColor,
                    image: "assets/image/twoarrowleft.png",
                  ),
                  _selectedOption == "noOption"
                      ? const SizedBox.shrink()
                      : SmallestButton(
                          onPressed: () {
                            if(_selectedOption == ""){
                              Alert.error("قم بختيار عمليه الاتاحة !");
                            }else{
                              Get.to(() => MessageFilesScreen(filesInputData));
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
    );
  }

  void onFirstAvailabilitySubmitTrue() {
    filesInputData.isThesisFileRequired = true;
    filesInputData.isThesisTitleFileRequired = false;
    filesInputData.isSubjectsIndexFileRequired = false;
    filesInputData.isArabicExtractFileRequired = false;
    filesInputData.isEnglishExtractFileRequired = false;
    filesInputData.isIntroFileRequired = false;
    filesInputData.isCollectionFileRequired = false;
    filesInputData.isQuarterCollectionFileRequired = false;
  }

  void onSecondAvailabilitySubmitTrue() {
    filesInputData.isThesisFileRequired = false;
    filesInputData.isThesisTitleFileRequired = true;
    filesInputData.isSubjectsIndexFileRequired = true;
    filesInputData.isArabicExtractFileRequired = false;
    filesInputData.isEnglishExtractFileRequired = false;
    filesInputData.isIntroFileRequired = false;
    filesInputData.isCollectionFileRequired = false;
    filesInputData.isQuarterCollectionFileRequired = false;
  }
  void onMessageSubmitFalse() {
    filesInputData.isThesisFileRequired = false;
    filesInputData.isThesisTitleFileRequired = false;
    filesInputData.isSubjectsIndexFileRequired = false;
    filesInputData.isArabicExtractFileRequired = false;
    filesInputData.isEnglishExtractFileRequired = false;
    filesInputData.isIntroFileRequired = false;
    filesInputData.isCollectionFileRequired = false;
    filesInputData.isQuarterCollectionFileRequired = false;
  }

  void onSecondAvailabilitySubmitFirst() {
    filesInputData.isThesisFileRequired = false;
    filesInputData.isThesisTitleFileRequired = true;
    filesInputData.isSubjectsIndexFileRequired = true;
    filesInputData.isArabicExtractFileRequired = false;
    filesInputData.isEnglishExtractFileRequired = false;
    filesInputData.isIntroFileRequired = false;
    filesInputData.isCollectionFileRequired = false;
    filesInputData.isQuarterCollectionFileRequired = false;
  }

  void onSecondAvailabilitySubmitSecond() {
    filesInputData.isThesisFileRequired = false;
    filesInputData.isThesisTitleFileRequired = true;
    filesInputData.isSubjectsIndexFileRequired = true;
    filesInputData.isArabicExtractFileRequired = true;
    filesInputData.isEnglishExtractFileRequired = true;
    filesInputData.isIntroFileRequired = false;
    filesInputData.isCollectionFileRequired = false;
    filesInputData.isQuarterCollectionFileRequired = false;
  }

  void onSecondAvailabilitySubmitThird() {
    filesInputData.isThesisFileRequired = false;
    filesInputData.isThesisTitleFileRequired = true;
    filesInputData.isSubjectsIndexFileRequired = true;
    filesInputData.isArabicExtractFileRequired = true;
    filesInputData.isEnglishExtractFileRequired = true;
    filesInputData.isIntroFileRequired = true;
    filesInputData.isCollectionFileRequired = false;
    filesInputData.isQuarterCollectionFileRequired = false;
  }

  void onSecondAvailabilitySubmitFourth() {
    filesInputData.isThesisFileRequired = false;
    filesInputData.isThesisTitleFileRequired = true;
    filesInputData.isSubjectsIndexFileRequired = true;
    filesInputData.isArabicExtractFileRequired = true;
    filesInputData.isEnglishExtractFileRequired = true;
    filesInputData.isIntroFileRequired = true;
    filesInputData.isCollectionFileRequired = false;
    filesInputData.isQuarterCollectionFileRequired = false;
  }


}
