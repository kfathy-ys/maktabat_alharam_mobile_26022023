import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/avaliable_time.dart';

import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/drop_down_entity_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/drop_down_library_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/hints.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../widgets/alerts.dart';
import '../../../../widgets/loading.dart';
import '../my_orders/cubit/visit_order_cubit.dart';
import '../my_orders/models/model.dart';
import '../my_orders/view.dart';
import '../new_order/cubit_available_dates/available_dates_cubit.dart';
import 'cubit/update_visit_order_cubit.dart';


// ignore: must_be_immutable
class UpdateOrderOfVisitRequest extends StatelessWidget {
  final MyOrderToVisit order;

  const UpdateOrderOfVisitRequest({Key? key, required this.order}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
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
          body: BlocProvider(
            create: (context) => UpdateVisitOrderCubit(order),
            child: BlocConsumer<UpdateVisitOrderCubit, UpdateVisitOrderState>(
              listener: (context, state) {
                if (state is UpdateVisitOrderSuccess) {
                  Alert.success(  "تم التعديل بنجاح");
                  BlocProvider.of<VisitOrderCubit>(context).getOrderVisit();
                  Get.offAll(() => MyOrderRequestVisitScreen());
                }
                if (state is UpdateVisitOrderError) {
                  Alert.error( state.msg.toString());
                }

              },
                builder: (context, state) {
                  final cubit = BlocProvider.of<UpdateVisitOrderCubit>(
                      context);
                  return Form(
                    key:cubit.formKey ,
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: ListView(
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
                            initial: cubit.initialAuthID,
                              onChanged: cubit.onAuthorityIDChanged,


                          ),
                          CustomTextField(
                            hint: "nameResponsible".tr,
                            dIcon: Icons.drive_file_rename_outline,
                            label: "nameResponsible".tr,
                            controller:cubit.nameController,
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
                            controller:cubit.emailController,
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
                            controller: cubit.phoneController,
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
                            controller: cubit.visitorsController,
                            validator: qValidator([
                              IsRequired("thisFieldRequired".tr),
                              IsOptional(),
                              MaxLength(30),
                            ]),
                            type: TextInputType.number,
                          ),

                          /// TODO:: DropDownListLibraryName
                          DropDownListLibraryName(
                            initial: BlocProvider.of<AvailableDatesCubit>(context).selectedLIB ,
                              onChanged: (value) {
                           cubit.getUpdatesAvailableDatesVisit(value.id!);
                            cubit.onLibChang(value.id!);

                          }),
                          Hints(title: "visitDate".tr),
                          state is! AvailableDatesLoading
                              ? Container(

                            height: height * 0.4,
                            width: width * 0.8,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 14),

                            decoration: BoxDecoration(
                                border: Border.all(color: kSafeAreasColor),
                                color: kPrimaryColor.withOpacity(0.1),
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
                                cubit.getUpdatesAvailablePeriodsVisit(
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
                            controller: cubit.visitorReasonController,
                            hint: "visitReason".tr,
                            text: "",
                          ),
                          buildSizedBox(height),
                          state is! AvailableDatesLoading ? Center(
                            child: MediaButtonSizer(
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.updateOrderToVisit(
                                    responsibleName: cubit.nameController.text,
                                    responsibleMobile: cubit.phoneController.text,
                                    responsibleEmail: cubit.emailController.text,
                                    numberOfVisitors: cubit.visitorsController.text,
                                    visitReason: cubit.visitorReasonController.text,
                                  );
                                } else {
                                  Alert.error("الرجاء التاكيد من الطلب ");
                                }
                              },
                              title: "save".tr,
                              color: kPrimaryColor,
                              image: "assets/image/rightsah.png",
                            ),
                          ) : const LoadingFadingCircle(),
                        ],
                      ),
                    ),
                  );
                },



                    ),
                  ),
                )

            ),);

  }


  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height * 0.05,
    );
  }
}
