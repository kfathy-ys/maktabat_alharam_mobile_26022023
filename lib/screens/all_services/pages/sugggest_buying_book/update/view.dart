import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/cubit/order_suggest_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/models/model.dart';
import '../../../../widgets/alerts.dart';
import '../../ask_Librarian/page/views/head_topices.dart';

import '../my_orders/view.dart';
import '../page/drop_down_book_type.dart';
import 'cubit/update_order_cubit.dart';
import 'page/hint_title.dart';
import '../../../../drawer/view.dart';

import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import 'package:get/get.dart';
import '../../../../widgets/customHeightTextFiled.dart';
import '../../../../widgets/customTextFeild.dart';
import '../../../../widgets/mdeiaButtonSizer.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

class UpdateSuggestToBuyBook extends StatefulWidget {
  final OrderModel order;
  const UpdateSuggestToBuyBook({Key? key,required this.order}) : super(key: key);
  @override
  State<UpdateSuggestToBuyBook> createState() => _UpdateSuggestToBuyBookState();
}
class _UpdateSuggestToBuyBookState extends State<UpdateSuggestToBuyBook> {
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
          body: BlocProvider(
            create: (context) => UpdateOrderCubit(widget.order),
            child: BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
              listener: (context, state) {
                if (state is UpdateOrderSuccess) {
                  Alert.success(  "تم التعديل بنجاح");
                  BlocProvider.of<OrderSuggestCubit>(context).getOrderSuggest();
                  Get.offAll(()=> const MyOrdersSuggestBuyBookScreen());
                }
                if (state is UpdateOrderError) {
                  Alert.error( state.msg.toString());
                }
              },
              builder: (context, state) {
                final cubit = BlocProvider.of<UpdateOrderCubit>(context);

                return SizedBox(
                  height: height,
                  width: width,
                  child: Form(
                    key: cubit.formKey,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      physics: const BouncingScrollPhysics(),
                      //  shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                          controller: cubit.nameController,
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
                          controller: cubit.emailController,
                          validator: qValidator([
                            IsRequired("thisFieldRequired".tr),
                            IsOptional(),
                            MaxLength(30),
                          ]),
                          type: TextInputType.emailAddress,
                        ),
                        CustomTextField(

                          hint: "phoneNumber".tr,
                          dIcon: Icons.phone_bluetooth_speaker,
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

                          hint: "qualifications".tr,
                          dIcon: Icons.verified_user,
                          label: "qualifications".tr,
                          controller: cubit.qualificationController,
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
                          controller: cubit.addressController,
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
                          controller: cubit.authorNameController,
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
                          controller: cubit.namePublisherController,
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
                          controller: cubit.placePublisherController,
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
                          controller: cubit.yearPublishController,
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
                          controller: cubit.standardNumberController,

                          validator: qValidator([
                            IsRequired("thisFieldRequired".tr),
                            IsOptional(),
                            MaxLength(30),
                          ]),
                          type: TextInputType.number,
                        ),
                        DropDownBookType(
                          onChanged: cubit.onBookTypeChanged,
                          initial: cubit.initial,
                        ),
                        SubHint(title: "additionalInformation".tr),
                        CustomHeightTextField(
                          hint: "additionalInformation".tr,
                          text: "",
                          controller: cubit.additionalInfoController,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Center(
                          child: MediaButtonSizer(
                            onPressed: () async{
                              if (cubit.formKey.currentState!.validate()) {
                                await cubit.updatedOrderSuggestBook(
                                  visitorName: cubit.nameController.text,
                                  visitorEmail: cubit.emailController.text,
                                  visitorMobile: cubit.phoneController.text,
                                  qualifications: cubit.qualificationController.text,
                                  bookTitle: cubit.addressController.text,
                                  authorName: cubit.authorNameController.text,
                                  publisherName: cubit.namePublisherController.text,
                                  placeOfPublication: cubit.placePublisherController.text,
                                  yearOfPublication: cubit.yearPublishController.text,
                                  standardBookNumber: cubit.standardNumberController.text,
                                  additionalInformation: cubit.additionalInfoController.text,
                                );
                              }
                            },
                            title: "save".tr,
                            color: kPrimaryColor,
                            image: "assets/image/rightsah.png",
                          ),
                        ),
                      ],
                    ),
                  ),
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
