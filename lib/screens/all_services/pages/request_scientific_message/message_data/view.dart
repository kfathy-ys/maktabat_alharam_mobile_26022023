
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

class MessageDataScreen extends StatefulWidget {
  const MessageDataScreen({Key? key}) : super(key: key);

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
          body: SizedBox(
            height: height,
            width: width,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),

              physics: const BouncingScrollPhysics(),
              //  shrinkWrap: true,
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
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  hint: "messageAddress".tr,
                  dIcon: Icons.add_circle_outline,
                  label: "messageAddress".tr,
                  controller: _messageAddressController,
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
                  controller: _degreeController,
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
                  controller: _yearOfDiscussionController,
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
                  controller: _pagesNumbersController,
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
                  controller: _numbersOfPartsController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
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
                        Get.to(() => const AvailabilityMessageScreen());
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
