import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';

import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/page/drop_down_book_type.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/mediaButton.dart';
import 'package:maktabat_alharam/screens/widgets/smallButton.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:queen/validation/it/is_email.dart';
import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';
import 'package:table_calendar/table_calendar.dart';





// ignore: must_be_immutable
class UpdateSuggestToBuyBook extends StatefulWidget {
  const UpdateSuggestToBuyBook({Key? key}) : super(key: key);

  @override
  State<UpdateSuggestToBuyBook> createState() =>
      _UpdateSuggestToBuyBookState();
}

class _UpdateSuggestToBuyBookState
    extends State<UpdateSuggestToBuyBook> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _questionController = TextEditingController();

  final _responseController = TextEditingController();

  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

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
              padding: const EdgeInsets.symmetric(vertical: 18),

              physics: const BouncingScrollPhysics(),
              //  shrinkWrap: true,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12),
                  child: HeadTopics(
                    title: "SuggestionBuyBook".tr,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CustomTextField(
                  hint: "name".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "name".tr,
                  controller: _emailController,
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
                  controller: _phoneController,
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
                  controller: _emailController,
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
                  controller: _phoneController,
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
                  controller: _emailController,
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
                  controller: _phoneController,
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
                  controller: _emailController,
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
                  controller: _phoneController,
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
                  controller: _emailController,
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
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
                ),
                const DropDownBookType(),


                buildPadding(title: "additionalInformation".tr),
                CustomHeightTextField(
                  hint: "additionalInformation".tr,
                  text: "",
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: MediaButtonSizer(
                    onPressed: () {

                      Get.to(()=> MyOrdersSuggestBuyBookScreen());
                    },
                    title: "saveUpdates".tr,
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
}
