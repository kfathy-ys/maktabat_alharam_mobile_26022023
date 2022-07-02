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
import 'package:queen/validation.dart';

import '../../../widgets/alerts.dart';
import '../../../widgets/loading.dart';
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

    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      appBar: customAppbar(
          icons: Icons.arrow_forward_outlined, isIcons: true, context: context),
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: height,
          width: width,
          child: BlocConsumer<AvailableDatesCubit, AvailableDatesState>(
            listener: (context, state) {},
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
                  DropDownEntityName(onChanged: cubit.onAuthorityIDChanged),
                  CustomTextField(
                    read: true,
                    hint: "nameResponsible".tr,
                    dIcon: Icons.drive_file_rename_outline,
                    label: "nameResponsible".tr,
                    controller: _nameController
                      ..text = Prefs.getString('fullName'),
                    validator: qValidator([
                      IsRequired("thisFieldRequired".tr),
                      // IsOptional(),
                      //   NotContains ("^\\s*([A-Za-z]{1,}([\\.,] |[-']| ))+[A-Za-z]+\\.?\\s*\$"),
                      MaxLength(30),
                    ]),
                    type: TextInputType.name,
                  ),
                  CustomTextField(
                    read: true,
                    hint: "email".tr,
                    dIcon: Icons.email_outlined,
                    label: "email".tr,
                    controller: _emailController
                      ..text = Prefs.getString('email'),
                    validator: qValidator([
                      IsRequired("thisFieldRequired".tr),
                      //   IsOptional(),
                      const IsEmail(),
                      MaxLength(30),
                    ]),
                    type: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    read: true,
                    hint: "phoneNumber".tr,
                    dIcon: Icons.drive_file_rename_outline,
                    label: "phoneNumber".tr,
                    controller: _phoneController
                      ..text = Prefs.getString('phoneNumber'),
                    validator: qValidator([
                      IsRequired("minPassword".tr),
                      // IsOptional(),
                      // MinLength(11),
                      MaxLength(15),
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
                      // IsOptional(),
                      //   IsNumber(),
                      MinLength(1),
                      MaxLength(30),
                    ]),
                    type: TextInputType.number,
                  ),

                  /// TODO:: DropDownListLibraryName
                  DropDownListLibraryName(onChanged: (value) {
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
                  state is! AvailableDatesLoading
                      ? Center(
                          child: MediaButtonSizer(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.createOrderToVisit(
                                  responsibleName: _nameController.text,
                                  responsibleMobile: _phoneController.text,
                                  responsibleEmail: _emailController.text,
                                  numberOfVisitors: _visitorsController.text,
                                  visitReason: _vistorReasonController.text,
                                );
                                Alert.success("تم إضافة طلبك بنجاح ");
                                Get.offAll(() => MyOrderRequestVisitScreen());
                              } else {
                                Alert.error("الرجاء التاكيد من الطلب ");
                              }
                            },
                            title: "requestService".tr,
                            color: kPrimaryColor,
                            image: "assets/image/rightsah.png",
                          ),
                        )
                      : const LoadingFadingCircle(),
                ],
              );
            },
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
