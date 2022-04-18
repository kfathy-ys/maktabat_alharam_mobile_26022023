import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';

import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/drop_down_entity_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/drop_down_library_name.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
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
class UpdateOrderOfVisitRequest extends StatefulWidget {
  const UpdateOrderOfVisitRequest({Key? key}) : super(key: key);

  @override
  State<UpdateOrderOfVisitRequest> createState() =>
      _UpdateOrderOfVisitRequestState();
}

class _UpdateOrderOfVisitRequestState
    extends State<UpdateOrderOfVisitRequest> {
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
                    title: "updateRequest".tr,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const DropDownEntityName(),
                CustomTextField(
                  hint: "nameResponsible".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "nameResponsible".tr,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  hint: "email".tr,
                  dIcon: Icons.phone,
                  label: "email".tr,
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
                  hint: "visitsNumbers".tr,
                  dIcon: Icons.phone,
                  label: "visitsNumbers".tr,
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.number,
                ),
                const DropDownListLibraryName(),

                buildPadding(title: "visitDate".tr),
                Container(
                  // color: kTextFieldColor,
                  height: height * 0.4,
                  width: width * 0.8,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 28,vertical: 14),

                  decoration: BoxDecoration(
                      color: kAccentColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: TableCalendar(
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: true,
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: kButtonGreenDark,
                        // borderRadius: BorderRadius.circular(5)
                      ),
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: kPrimaryColor,

                        // borderRadius: BorderRadius.circular(5),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(5)

                        ),
                      ),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: kSafeAreasColor,
                        fontSize: 16,
                        fontFamily: "DinReguler",
                      ),
                      weekendStyle: TextStyle(
                        color: kSafeAreasColor,
                        fontSize: 16,
                        fontFamily: "DinReguler",
                      ),
                    ),
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    headerStyle: const HeaderStyle(
                      leftChevronVisible: true,
                      rightChevronVisible: true,
                      titleCentered: true,
                      headerPadding: EdgeInsets.symmetric(horizontal: 30.0),
                      titleTextStyle: TextStyle(
                        color: kSafeAreasColor,
                        fontSize: 16,
                        fontFamily: "DinReguler",
                      ),
                      formatButtonVisible: false,
                    ),
                    daysOfWeekHeight: 28.0,
                    // height between the date rows, default is 52.0
                    rowHeight: 30.0,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2031),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                buildPadding(title: "requiredDate".tr),
                Container(
                  height: height * 0.08,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: kBackgroundCardColor,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 28,vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("from".tr,style: const TextStyle(
                        color: kBlackText,
                        fontSize: 16,
                        fontFamily: "DinReguler",
                      ),),
                      Container(
                        //  color: Colors.red,
                        width: width*0.1,
                        height: height * 0.05,
                        child: TextFormField(),
                      ),
                      InkWell(

                          onTap: () async {
                            await showTimePicker(
                              errorInvalidText: "No",
                              context: context,
                              initialTime: TimeOfDay.now(),
                              confirmText: 'Ok',
                              cancelText: 'Cancel',

                              // builder: (BuildContext context, Widget child) {
                              //   return Directionality(
                              //     textDirection: TextDirection.rtl,
                              //     child: child,
                              //   );
                              // },
                            );
                          },
                          child: Image.asset("assets/image/twoarrow.png")),
                      Text("to".tr,style: const TextStyle(
                        color: kBlackText,
                        fontSize: 16,
                        fontFamily: "DinReguler",
                      ),),
                      Container(
                        // color: Colors.red,
                        width: width*0.1,
                        height: height * 0.05,
                        child: TextFormField(),
                      ),
                      InkWell(
                          onTap: () async {
                            await showTimePicker(
                              context: context,
                              errorInvalidText: "No",
                              initialTime: TimeOfDay.now(),
                              confirmText: 'Ok',

                              cancelText: 'Cancel',

                              // builder: (BuildContext context, Widget child) {
                              //   return Directionality(
                              //     textDirection: TextDirection.rtl,
                              //     child: child,
                              //   );
                              // },
                            );
                          },

                          child: Image.asset("assets/image/twoarrow.png")),
                    ],
                  ),
                ),
                CustomHeightTextField(
                  hint: "visitReason".tr,
                  text: "",
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: MediaButtonSizer(
                    onPressed: () {

                      Get.to(()=> MyHomeScreen());
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
