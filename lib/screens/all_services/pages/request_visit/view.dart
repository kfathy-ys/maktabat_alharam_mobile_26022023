import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/my_orders/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/new_order/cubit_available_dates/available_dates_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/avaliable_time.dart';

import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/drop_down_library_name.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:queen/core/helpers/prefs.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/alerts.dart';
import '../../../widgets/loading.dart';
import 'my_orders/cubit/visit_order_cubit.dart';
import 'page/views/drop_down_entity_name.dart';
import 'page/views/hints.dart';

class RequestVisitScreen extends StatefulWidget {
  const RequestVisitScreen({Key? key}) : super(key: key);

  @override
  State<RequestVisitScreen> createState() => _RequestVisitScreenState();
}

class _RequestVisitScreenState extends State<RequestVisitScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _visitorsController = TextEditingController();

  final _vistorReasonController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final fullName = Prefs.getString('fullName');
    final email = Prefs.getString('email');
    final phoneNumber = Prefs.getString('phoneNumber');

    return Container(
      color: kAppBarColor,
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
            child: BlocConsumer<AvailableDatesCubit, AvailableDatesState>(
              listener: (context, state) {
              },
              builder: (context, state) {
                final cubit = BlocProvider.of<AvailableDatesCubit>(context);
                return ListView(
                  padding: const EdgeInsets.symmetric(vertical: 18),

                  physics: const BouncingScrollPhysics(),
                  //  shrinkWrap: true,
                  children: [
                    HeadTopics(
                      title: "RequestVisit".tr,
                    ),
                    buildSizedBox(height),

                    /// TODO:: DropDownEntityName
                    DropDownEntityName(
                      onChanged: cubit.onAuthorityIDChanged

                    ),
                    CustomTextField(
                      hint: "nameResponsible".tr,
                      dIcon: Icons.drive_file_rename_outline,
                      label: "nameResponsible".tr,
                      controller: _nameController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired".tr),
                        IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.name,
                    ),
                    CustomTextField(
                      hint: "email".tr,
                      dIcon: Icons.email_outlined,
                      label: "email".tr,
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
                      hint: "visitsNumbers".tr,
                      dIcon: Icons.person_add_alt,
                      label: "visitsNumbers".tr,
                      controller: _visitorsController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired".tr),
                        IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.number,
                    ),

                    /// TODO:: DropDownListLibraryName
                    DropDownListLibraryName(

                        onChanged: (value) {
                      cubit.getAvailableDatesVisit(value.id!);
                      cubit.onLibChang(value);
                    }),
                    Hints(title: "visitDate".tr),
                    state is! AvailableDatesLoading
                        ? Container(
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
                            // child: TableCalendar(
                            //   calendarStyle: const CalendarStyle(
                            //     outsideDaysVisible: true,
                            //     todayDecoration: BoxDecoration(
                            //       shape: BoxShape.rectangle,
                            //       color: kButtonGreenDark,
                            //       // borderRadius: BorderRadius.circular(5)
                            //     ),
                            //     selectedDecoration: BoxDecoration(
                            //       shape: BoxShape.rectangle,
                            //       color: kPrimaryColor,
                            //
                            //       // borderRadius: BorderRadius.circular(5),
                            //     ),
                            //     defaultDecoration: BoxDecoration(
                            //       shape: BoxShape.rectangle,
                            //       borderRadius: BorderRadius.all(Radius.circular(5)),
                            //     ),
                            //   ),
                            //   daysOfWeekStyle: const DaysOfWeekStyle(
                            //     weekdayStyle: TextStyle(
                            //       color: kSafeAreasColor,
                            //       fontSize: 16,
                            //       fontFamily: "DinReguler",
                            //     ),
                            //     weekendStyle: TextStyle(
                            //       color: kSafeAreasColor,
                            //       fontSize: 16,
                            //       fontFamily: "DinReguler",
                            //     ),
                            //   ),
                            //   startingDayOfWeek: StartingDayOfWeek.sunday,
                            //   headerStyle: const HeaderStyle(
                            //     leftChevronVisible: true,
                            //     rightChevronVisible: true,
                            //     titleCentered: true,
                            //     headerPadding: EdgeInsets.symmetric(horizontal: 30.0),
                            //     titleTextStyle: TextStyle(
                            //       color: kSafeAreasColor,
                            //       fontSize: 16,
                            //       fontFamily: "DinReguler",
                            //     ),
                            //     formatButtonVisible: false,
                            //   ),
                            //   daysOfWeekHeight: 28.0,
                            //   // height between the date rows, default is 52.0
                            //   rowHeight: 30.0,
                            //   enabledDayPredicate: (day){
                            //     log(day.toString());
                            //     // return cubit.availableDates.contains(day);
                            //     if(cubit.availableDates.contains(day)) {
                            //       return true;
                            //     }else{
                            //       return false;
                            //     }
                            //
                            //   },
                            //   // selectedDayPredicate: (day){
                            //   //   return cubit.availableDates.contains(day);
                            //   // },
                            //   firstDay:cubit.dates.isNotEmpty?cubit.dates.first.date: DateTime.now(),
                            //   lastDay: cubit.dates.isNotEmpty?cubit.dates.last.date:DateTime(2031),
                            //   focusedDay: _focusedDay,
                            //   // calendarFormat: _calendarFormat,
                            //   // selectedDayPredicate: (day) {
                            //   //   // Use `selectedDayPredicate` to determine which day is currently selected.
                            //   //   // If this returns true, then `day` will be marked as selected.
                            //   //
                            //   //   // Using `isSameDay` is recommended to disregard
                            //   //   // the time-part of compared DateTime objects.
                            //   //   return isSameDay(_selectedDay, day);
                            //   // },
                            //   //
                            //   // onDaySelected: (selectedDay, focusedDay) {
                            //   //   if (!isSameDay(_selectedDay, selectedDay)) {
                            //   //     // Call `setState()` when updating the selected day
                            //   //     setState(() {
                            //   //       _selectedDay = selectedDay;
                            //   //       _focusedDay = focusedDay;
                            //   //     });
                            //   //   }
                            //   // },
                            //   // onFormatChanged: (format) {
                            //   //   if (_calendarFormat != format) {
                            //   //     // Call `setState()` when updating calendar format
                            //   //     setState(() {
                            //   //       _calendarFormat = format;
                            //   //     });
                            //   //   }
                            //   // },
                            //   // onPageChanged: (focusedDay) {
                            //   //   // No need to call `setState()` here
                            //   //   _focusedDay = focusedDay;
                            //   // },
                            // ),
                            child: CalendarDatePicker(
                              initialDate: cubit.dates.isNotEmpty
                                  ? cubit.dates.first.date
                                  : DateTime.now(),
                              firstDate: cubit.dates.isNotEmpty
                                  ? cubit.dates.first.date
                                  : DateTime.now(),
                              lastDate: cubit.dates.isNotEmpty
                                  ? cubit.dates.last.date
                                  : DateTime(2031),
                              onDateChanged: (value) {
                                cubit.getAvailablePeriodsVisit(
                                    selectedDate: value);
                                cubit.visitDateId = cubit
                                    .dates[cubit.availableDates.indexOf(value)]
                                    .id;
                              },
                              selectableDayPredicate: (day) {
                                if (cubit.dates.isNotEmpty) {
                                  if (cubit.availableDates.contains(day)) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                } else {
                                  return true;
                                }
                              },
                            ),
                          )
                        : const LoadingFadingCircleSmall(),

                    Hints(title: "AvailablePeriods".tr),
                    if (cubit.periods.isNotEmpty)
                      state is! AvailableDatesLoading
                          ? AvailableTime(
                              periods: cubit.periods,
                            )
                          : const LoadingFadingCircleSmall(),
                    if (cubit.periods.isEmpty)
                      const Center(
                        child: Text("لايوجد مواعيد متاحة الان"),
                      ),
                    CustomHeightTextField(
                      controller: _vistorReasonController,
                      hint: "visitReason".tr,
                      text: "",
                    ),
                    buildSizedBox(height),
                    state is! AvailableDatesLoading?  Center(
                      child: MediaButtonSizer(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.createOrderToVisit(
                            responsibleName: _nameController.text,
                            responsibleMobile: _phoneController.text,
                             responsibleEmail: _emailController.text,
                              numberOfVisitors: _visitorsController.text,
                              visitReason: _vistorReasonController.text,
                             // requestStatusId: 4,
                            );
                            Get.offAll(() => MyOrderRequestVisitScreen());
                          }else{
                            Alert.error("الرجاء التاكيد من الطلب ");
                          }


                        },
                        title: "requestService".tr,
                        color: kPrimaryColor,
                        image: "assets/image/rightsah.png",
                      ),
                    )  : const LoadingFadingCircle(),
                  ],
                );
              },
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
