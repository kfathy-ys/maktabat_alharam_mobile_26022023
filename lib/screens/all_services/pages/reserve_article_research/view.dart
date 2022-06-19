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

                      if (cubit.isResearchRetreat && cubit.rooms.isNotEmpty)
                        DropDownListHallName(
                        rooms: cubit.rooms,
                          onChanged:(value){
                          //  cubit.onRoomsIDChanged(value);
                           cubit. getAvailableValidDatesResearch(value.id!);


                          }),

                      if (cubit.isScientificMaterial   ) callNumber(),


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
                       // cubit.getAvailableDatesVisit(value.id!);
                        cubit.onQualificationIDChanged(value);
                      }),
                      buildPadding(title: "requiredDate".tr),

                      // Container(
                      //   height: height * 0.4,
                      //   padding: const EdgeInsets.symmetric(horizontal: 12),
                      //   margin: const EdgeInsets.symmetric(
                      //       horizontal: 28, vertical: 14),
                      //
                      //   decoration: BoxDecoration(
                      //       color: kHomeColor,
                      //       border: Border.all(color: kSafeAreasColor),
                      //
                      //       borderRadius: BorderRadius.circular(8)),
                      //   child:  SfDateRangePicker(
                      //     selectableDayPredicate: (day) {
                      //       if (cubit.dates.isNotEmpty) {
                      //         if (cubit.availableDates.contains(day)) {
                      //           return true;
                      //         } else {
                      //           return false;
                      //         }
                      //       } else {
                      //         return true;
                      //       }
                      //     },
                      //
                      //
                      //     endRangeSelectionColor: kSafeAreasColor,
                      //     showActionButtons: true,
                      //     startRangeSelectionColor: kSafeAreasColor,
                      //     rangeSelectionColor: kPrimaryColor,
                      //     view: DateRangePickerView.month,
                      //     selectionMode: DateRangePickerSelectionMode.range,
                      //     enableMultiView: true,
                      //   ),
                      // ),
                      Container(

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
                              ? cubit.dates.first.date
                              : DateTime.now(),
                          firstDate: cubit.dates.isNotEmpty
                              ? cubit.dates.first.date
                              : DateTime.now(),
                          lastDate: cubit.dates.isNotEmpty
                              ? cubit.dates.last.date
                              : DateTime(2031),
                          onDateChanged: (value) {

                          cubit.selectDay(value);

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
                      ),

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
