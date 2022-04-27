import 'dart:developer';

import 'package:flutter/material.dart';
import '../../ask_Librarian/page/views/head_topices.dart';

import '../my_orders/view.dart';
import '../page/drop_down_book_type.dart';
import 'page/hint_title.dart';
import '../../../../drawer/view.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import 'package:get/get.dart';
import '../../../../widgets/customHeightTextFiled.dart';
import '../../../../widgets/customTextFeild.dart';
import '../../../../widgets/mdeiaButtonSizer.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';


class UpdateSuggestToBuyBook extends StatefulWidget {
  const UpdateSuggestToBuyBook({Key? key}) : super(key: key);

  @override
  State<UpdateSuggestToBuyBook> createState() => _UpdateSuggestToBuyBookState();
}

class _UpdateSuggestToBuyBookState extends State<UpdateSuggestToBuyBook> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _qualificationController = TextEditingController();

  final _authAddressController = TextEditingController();

  final _authNameController = TextEditingController();

  final _publisherNameController = TextEditingController();

  final _publishLocationController = TextEditingController();

  final _publishYearController = TextEditingController();

  final _bookController = TextEditingController();

  final addCommentController = TextEditingController();

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
          body: SizedBox(
            height: height,
            width: width,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 18),

              physics: const BouncingScrollPhysics(),
              //  shrinkWrap: true,
              children: [
                HeadTopics(
                  title: "SuggestionBuyBook".tr,
                ),
                buildSizedBox(height),
                CustomTextField(
                  hint: "name".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "name".tr,
                  controller: _nameController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  hint: "emailDot".tr,
                  dIcon: Icons.email,
                  label: "emailDot".tr,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.emailAddress,
                ),
                CustomTextField(
                  hint: "phoneNumber".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "phoneNumber".tr,
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.phone,
                ),
                CustomTextField(
                  hint: "qualifications".tr,
                  dIcon: Icons.verified_user,
                  label: "qualifications".tr,
                  controller: _qualificationController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  hint: "authorAddress".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "authorAddress".tr,
                  controller: _authAddressController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.streetAddress,
                ),
                CustomTextField(
                  hint: "authorName".tr,
                  dIcon: Icons.person_add_alt,
                  label: "authorName".tr,
                  controller: _authNameController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  hint: "publisherName".tr,
                  dIcon: Icons.person_add_alt,
                  label: "publisherName".tr,
                  controller: _publisherNameController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  hint: "publishLocation".tr,
                  dIcon: Icons.location_on_outlined,
                  label: "publishLocation".tr,
                  controller: _publishLocationController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.streetAddress,
                ),
                CustomTextField(
                  hint: "publishYear".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "publishYear".tr,
                  controller: _publishYearController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.datetime,
                ),
                CustomTextField(
                  hint: "standardBookNumber".tr,
                  dIcon: Icons.confirmation_number_outlined,
                  label: "standardBookNumber".tr,
                  controller: _bookController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
                ),
                const DropDownBookType(),
                SubHint(title: "additionalInformation".tr),
                CustomHeightTextField(
                  controller: addCommentController,
                  hint: "additionalInformation".tr,
                  text: "",
                ),
                buildSizedBox(height),
                Center(
                  child: MediaButtonSizer(
                    onPressed: () {
                      Get.to(() => MyOrdersSuggestBuyBookScreen());
                    },
                    title: "save".tr,
                    color: kPrimaryColor,
                    image: "assets/image/rightsah.png",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
                height: height * 0.05,
              );
  }


}
