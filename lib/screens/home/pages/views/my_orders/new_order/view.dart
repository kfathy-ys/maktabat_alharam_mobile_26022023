import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
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

import 'page/views/drop_down_hall_name.dart';
import 'page/views/drop_down_items.dart';
import 'page/views/drop_down_library_name.dart';
import 'page/views/drop_down_qualification.dart';

// ignore: must_be_immutable
class NewOrderToReserveScientificResearch extends StatefulWidget {
  NewOrderToReserveScientificResearch({Key? key}) : super(key: key);

  @override
  State<NewOrderToReserveScientificResearch> createState() =>
      _NewOrderToReserveScientificResearchState();
}

class _NewOrderToReserveScientificResearchState
    extends State<NewOrderToReserveScientificResearch> {
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
                    title: "RequestVisit".tr,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const DropDownListServiceName(),
                const DropDownListLibraryName(),
                const DropDownListHallName(),
                CustomTextField(
                  hint: "userName".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "userName".tr,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  hint: "phone".tr,
                  dIcon: Icons.phone,
                  label: "phone".tr,
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired("phone".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                const DropDownListQualification(),
                buildPadding(title: "requiredDate".tr),
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
                CustomHeightTextField(
                  hint: "visitReason".tr,
                  text: "",
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                    child: MediaButtonSizer(
                  onPressed: () {},
                  title: "saveUpdates".tr,
                  color: kPrimaryColor,
                  image: "assets/image/rightsah.png",
                ))
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
