import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/config/enums.dart';

import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/page/views/drop_down_library_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/drop_down_hall_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/drop_down_items.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/page/drop_down_qualification.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/update/cubit_update/avalible_dates_research_update_cubit.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/custom_textFornField_range.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:provider/provider.dart';
import 'package:queen/queen.dart' hide NationsTrans;

import '../my_order/models/model.dart';
import '../page/alert_to_make_sure.dart';



// ignore: must_be_immutable
class UpdateReserveArticleRetreated extends StatefulWidget {
  MyOrdersToResearch? myOrdersToResearch;
   UpdateReserveArticleRetreated({Key? key, required this.myOrdersToResearch}) : super(key: key);

  @override
  State<UpdateReserveArticleRetreated> createState() =>
      _UpdateReserveArticleRetreatedState();
}

class _UpdateReserveArticleRetreatedState
    extends State<UpdateReserveArticleRetreated> {


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

  List<int> selectedIdRoom =[];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => AvalibleDatesResearchUpdateNotifier(widget.myOrdersToResearch!),
      child: Container(
        color: kAppBarColor,
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: drawer(context: context),
          appBar: customAppbar(
            icons: Icons.arrow_forward_outlined,
            isIcons: true,
            context: context,
          ),
          body: Consumer<AvalibleDatesResearchUpdateNotifier>(
            builder: (context, provider, __) {

              return Form(
                key: provider.formKey,
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        // key: UniqueKey(),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadTopics(
                            title: "RequestReserveArticleOrResearchRetreat".tr,
                          ),
                          buildSizedBox(height),
                          DropDownListServiceName(
                            initial: provider.selectedType,
                            onChanged: provider.onTypeChanges,
                          ),
                          DropDownListLibraryName(
                            key: UniqueKey(),
                            onChanged: provider.onLibChang,
                            initial: provider.selectedLIB,
                          ),
                          if (provider.hasSelectedType &&
                              provider.selectedType!.shouldPickHall)
                            DropDownListHallName(
                                initial: provider.selectedRoom,
                                rooms: provider.rooms,
                                onChanged: provider.selectRoom),
                          if (provider.hasSelectedType &&
                              provider.selectedType!.shouldEnterCallNumber)
                            CustomTextField(
                              hint: "رقم النداء".tr,
                              dIcon: Icons.drive_file_rename_outline,
                              label: "رقم النداء".tr,
                              controller: provider.callController,
                              validator: qValidator([
                                IsRequired("thisFieldRequired".tr),
                                MaxLength(30),
                              ]),
                              type: TextInputType.number,
                            ),
                          CustomTextField(
                            read: true,
                            hint: "userName".tr,
                            dIcon: Icons.drive_file_rename_outline,
                            label: "userName".tr,
                            controller: provider.userNameController..text = Prefs.getString('fullName'),
                            validator: qValidator([
                              IsRequired("thisFieldRequired".tr),
                              MaxLength(30),
                            ]),
                            type: TextInputType.name,
                          ),
                          CustomTextField(
                            read: true,
                            hint: "phoneNumber".tr,
                            dIcon: Icons.phone,
                            label: "phoneNumber".tr,
                            controller: provider.phoneController..text = Prefs.getString('phoneNumber'),
                            validator: qValidator([
                              IsRequired("phone".tr),
                              MaxLength(30),
                            ]),
                            type: TextInputType.phone,
                          ),
                          DropDownListQualifications(
                            onChanged: (value) {
                              provider.onQualificationIDChanged(value);
                            },
                          ),
                          const AlertMessage(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomTextFieldRange(
                                dIcon: Icons.date_range_outlined,
                                hint: "periods".tr,
                                controller: provider.fromController,
                                onTap: ()async {
                                  await  showDateRangePicker(
                                    context: context,

                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2030),

                                  ).then((value) {
                                    if(value == null) return;
                                    provider.fromController.text= '${value.start.toString().substring(0,10) }\t \t  || \t \t ${value.end.toString().substring(0,10)} ';

                                    provider.onRageChanges(value);
                                  });


                                },

                              ),

                            ],
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kSafeAreasColor)),
                              width: width * 0.8,
                              child: CalendarDatePicker2(
                                // onDisplayedMonthChanged: (obj) {
                                //   if (obj == null) return;
                                //   if (obj.runtimeType == PickerDateRange) {
                                //     provider
                                //         .onRageChanges(obj as PickerDateRange);
                                //   }
                                // },
                                selectableDayPredicate: provider.isDayAvialable,
                                config: CalendarDatePicker2Config(
                                  calendarType: CalendarDatePicker2Type.range,
                                ),
                                initialValue: const [],
                              ),

                            ),
                          ),
                          CustomHeightTextField(
                            hint: "visitReason".tr,
                            text: "",
                          ),
                          buildSizedBox(height),
                          Center(
                            child: MediaButtonSizer(
                              onPressed: ()=>provider.submit(),
                              title: "requestService".tr,
                              color: kPrimaryColor,
                              image: "assets/image/rightsah.png",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
