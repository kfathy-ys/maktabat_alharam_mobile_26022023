import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/drop_down_library_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/cubit_avalible_dates_research/avalible_dates_research_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/drop_down_hall_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/drop_down_items.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/drop_down_qualification.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:queen/validation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../widgets/alerts.dart';
import 'my_order/view.dart';

// ignore: must_be_immutable
class ReserveResearchRetreatScreen extends StatefulWidget {
  const ReserveResearchRetreatScreen({Key? key}) : super(key: key);

  @override
  State<ReserveResearchRetreatScreen> createState() =>
      _ReserveResearchRetreatScreenState();
}

class _ReserveResearchRetreatScreenState
    extends State<ReserveResearchRetreatScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _userController = TextEditingController();
  final _phoneController = TextEditingController();

  final _datePickerController = DateRangePickerController();

  String? dropdownValue;
  dynamic selectedTimeFrom;
  dynamic selectedTimeTo;

  final fullName = Prefs.getString('fullName');
  final email = Prefs.getString('email');
  final phoneNumber = Prefs.getString('phoneNumber');



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
          body: Form(
            key: _formKey,
            child: SizedBox(
              height: height,
              width: width,
              child: BlocConsumer<AvalibleDatesResearchCubit,
                  AvalibleDatesResearchState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit =
                      BlocProvider.of<AvalibleDatesResearchCubit>(context);
                  return ListView(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      HeadTopics(
                        title: "RequestReserveArticleOrResearchRetreat".tr,
                      ),
                      buildSizedBox(height),
                      DropDownListServiceName(
                        // onChanged: cubit.onAuthorityIDChanged
                        onChanged: cubit.selectService,
                      ),
                      DropDownListLibraryName(onChanged: (value) {
                        cubit.onLibChang(value);
                        cubit.getAvailableDatesResearch(value.id!);
                      }),

                      if (cubit.isResearchRetreat)  DropDownListHallName(
                          onChanged:(value){
                            cubit.onRoomsIDChanged(value);

                          }),

                      if (cubit.isScientificMaterial) callNumber(),


                      CustomTextField(
                        hint: "userName".tr,
                        dIcon: Icons.drive_file_rename_outline,
                        label: "userName".tr,
                        controller: _userController,
                        validator: qValidator([
                          IsRequired("thisFieldRequired".tr),
                        //  IsOptional(),
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
                      //    IsOptional(),
                          MaxLength(30),
                        ]),
                        type: TextInputType.phone,
                      ),
                      DropDownListQualifications(onChanged: (value) {
                        cubit.getRoomResearch(value.id!);
                        cubit.onQualificationIDChanged(value);
                      }),
                      buildPadding(title: "requiredDate".tr),

                /*      Container(
                        // color: kTextFieldColor,
                        height: height * 0.4,
                        // width: width * 0.8,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 14),

                        decoration: BoxDecoration(
                            color: kAccentColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: SfDateRangePicker(
                          view: DateRangePickerView.month,
                          monthViewSettings:
                              const DateRangePickerMonthViewSettings(
                                  firstDayOfWeek: 6),
                          selectionMode:
                              DateRangePickerSelectionMode.multiRange,
                          //onSelectionChanged: _onSelectionChanged,
                          showActionButtons: true,
                          controller: _datePickerController,
                          onSubmit: (Object? val) {
                            log(val.toString());
                          },
                          onCancel: () {
                            _datePickerController.selectedRanges = null;
                          },
                        ),
                      ),*/
                      Container(
                        // color: kTextFieldColor,
                        height: height * 0.4,
                        width: width * 0.8,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 14),

                        decoration: BoxDecoration(
                            border: Border.all(color: kSafeAreasColor),
                            color: kHomeColor,
                            borderRadius: BorderRadius.circular(8)),

                        child: CalendarDatePicker(
                          initialDate: cubit.dates.isNotEmpty
                              ? cubit.dates.first.date!
                              : DateTime.now(),
                          firstDate: cubit.dates.isNotEmpty
                              ? cubit.dates.first.date!
                              : DateTime.now(),
                          lastDate: cubit.dates.isNotEmpty
                              ? cubit.dates.last.date!
                              : DateTime(2031),
                          onDateChanged: cubit.selectDay,

                        ),
                      ),
                      /*  buildPadding(title: "visitDate".tr),
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
                  ),*/
                      CustomHeightTextField(
                        hint: "visitReason".tr,
                        text: "",
                      ),
                      buildSizedBox(height),
                      Center(
                          child: MediaButtonSizer(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.createOrderToResearch(
                              callNum: "  ",
                              roomId: 1,
                              numberOfVisitors: 1,
                              visitReason: "visitReason",
                            );
                            Alert.success("تم إضافة طلبك بنجاح ");
                            Get.off(
                                () => const MyOrderReserveArticleResearch());
                          } else {
                            Alert.error("الرجاء التاكيد من الطلب ");
                          }
                        },
                        title: "requestService".tr,
                        color: kPrimaryColor,
                        image: "assets/image/rightsah.png",
                      ))
                    ],
                  );
                },
              ),
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

/*  void _showDatePicker(bool isFrom) {
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
  }*/

  Widget _selectTextField = const SizedBox();

  callNumber() {
    return CustomTextField(
      hint: "رقم النداء".tr,
      dIcon: Icons.drive_file_rename_outline,
      label: "رقم النداء".tr,
      controller: _emailController,
      validator: qValidator([
        IsRequired("thisFieldRequired".tr),
        IsOptional(),
        MaxLength(30),
      ]),
      type: TextInputType.name,
    );
  }
}
