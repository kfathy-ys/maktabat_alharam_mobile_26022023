import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/my_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/drop_down_library_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/head_topices.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:queen/validation.dart';

class UpdateReserveArticleRetreated extends StatefulWidget {
  const UpdateReserveArticleRetreated({Key? key}) : super(key: key);

  @override
  State<UpdateReserveArticleRetreated> createState() =>
      _UpdateReserveArticleRetreatedState();
}

class _UpdateReserveArticleRetreatedState
    extends State<UpdateReserveArticleRetreated> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  dynamic selectedTimeFrom;
  dynamic selectedTimeTo;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
          backgroundColor: kHomeColor,
          drawer: drawer(context: context),
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              context: context),
          body: SizedBox(
            //  margin:ri const EdgeInsets.symmetric(hozontal: 0,vertical: 10),
            height: height,

            width: width,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 18),

              physics: const BouncingScrollPhysics(),
              //  shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: HeadTopics(
                    title: "RequestReserveArticleOrResearchRetreat".tr,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                //const DropDownListServiceName(),
                const DropDownListLibraryName(),
                //  const DropDownListHallName(),
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
                //   const DropDownListQualification(),
                buildPadding(title: "requiredDate".tr),
                Container(
                  height: height * 0.08,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: kBackgroundCardColor,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "from".tr,
                        style: const TextStyle(
                          color: kBlackText,
                          fontSize: 16,
                          fontFamily: "DinReguler",
                        ),
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(top: 5),
                        width: width * 0.1,
                        height: height * 0.05,
                        child: Text(
                          "${selectedTimeFrom ?? ""}  ",
                          style: const TextStyle(
                            fontSize: 16,
                            color: kSafeAreasColor,
                            fontFamily: "DinReguler",
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            _showDatePicker(true);
                          },
                          child: Image.asset("assets/image/twoarrow.png")),
                      Text(
                        "to".tr,
                        style: const TextStyle(
                          color: kBlackText,
                          fontSize: 16,
                          fontFamily: "DinReguler",
                        ),
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(top: 5),
                        width: width * 0.1,
                        height: height * 0.05,
                        child: Text(
                          "${selectedTimeTo ?? ""}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: kSafeAreasColor,
                            fontFamily: "DinReguler",
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            _showDatePicker(false);
                          },
                          child: Image.asset("assets/image/twoarrow.png")),
                    ],
                  ),
                ),
                /*      buildPadding(title: "visitDate".tr),
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
                buildPadding(title: "AvailablePeriods".tr),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 22),
                  height: height * 0.089,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context , int index){
                      return Container(
                        height: height * 0.079,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 12),

                        decoration: BoxDecoration(
                            color: kBackgroundCardColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("6:35 PM\t\t".tr,style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontFamily: "DinReguler",
                            ),),
                            Text("2:35 PM".tr,style: const TextStyle(
                              color: kBlackText,
                              fontSize: 16,
                              fontFamily: "DinReguler",
                            ),),
                          ],
                        ),

                      );
                    },

                  ),
                ),
              */
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
                    Get.to(() => const MyOrderReserveArticleResearch());
                  },
                  title: "saveUpdates".tr,
                  color: kPrimaryColor,
                  image: "assets/image/rightsah.png",
                ))
              ],
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

  final now = DateTime.now();
  String? datePicked;
  DateTime? time;

  void _showDatePicker(bool isFrom) {
    DatePicker.showTimePicker(context, showTitleActions: true,
        onChanged: (date) {
      log('change $date');
    }, onConfirm: (date) {
      setState(() {
        if (isFrom == true) {
          selectedTimeFrom = DateFormat('hh-mm', "en_US").format(date);
        } else {
          selectedTimeTo = DateFormat('hh-mm', "en_US").format(date);
        }

        log('confirm $date');
      });
    }, currentTime: DateTime.now());
  }
}
