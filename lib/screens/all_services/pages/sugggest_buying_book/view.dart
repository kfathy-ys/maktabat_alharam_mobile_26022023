import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/new_order/cubit/new_order_cubit.dart';

import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/page/drop_down_book_type.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/alart.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:queen/core/helpers/prefs.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

import 'my_orders/cubit/order_suggest_cubit.dart';
import 'my_orders/view.dart';

// ignore: must_be_immutable
class SuggestToBuyBook extends StatelessWidget {
   SuggestToBuyBook({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _qualificationController = TextEditingController();
  final _addressController = TextEditingController();

  final _authorNameController = TextEditingController();

  final _namePublisherController = TextEditingController();

  final _placePublisherController = TextEditingController();

  final _yearPublishController = TextEditingController();

  final _standardNumberController = TextEditingController();
  final _typeBookController = TextEditingController();

  final _addtionalInfoController = TextEditingController();

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
          body: BlocConsumer<NewOrderCubit, NewOrderState>(
            listener: (context, state) {
               if(state is NewOrderSuccess){
                 alertWithSuccess(context, "تم إضافة طلبك بنجاح");
                 BlocProvider.of<OrderSuggestCubit>(context).getOrderSuggest();
                 Get.off(
                         () => const MyOrdersSuggestBuyBookScreen());
               }
               else if (state is NewOrderError){
                 alertWithErr(context,  state.msg);
              }

            },
            builder: (context, state) {
              final cubit = BlocProvider.of<NewOrderCubit>(context);
              return SizedBox(
                height: height,
                width: width,
                child: Form(
                  key: _formKey,
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
                        controller: _nameController,
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
                        hint: "qualifications".tr,
                        dIcon: Icons.verified_user,
                        label: "qualifications".tr,
                        controller: _qualificationController,
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
                        controller: _addressController,
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
                        controller: _authorNameController,
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
                        controller: _namePublisherController,
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
                        controller: _placePublisherController,
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
                        controller: _yearPublishController,
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
                        controller: _standardNumberController,
                        validator: qValidator([
                          IsRequired("thisFieldRequired".tr),
                          IsOptional(),
                          MaxLength(30),
                        ]),
                        type: TextInputType.number,
                      ),
                      DropDownBookType(
                        onChanged: cubit.onBookTypeChanged,

                      ),
                      buildPadding(title: "additionalInformation".tr),
                      CustomHeightTextField(
                        hint: "additionalInformation".tr,
                        text: "",
                        controller: _addtionalInfoController,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      state is! NewOrderLoading ?    Center(
                        child: MediaButtonSizer(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.createOrderSuggestBook(

                                visitorName: _nameController.text,
                                visitorEmail: _emailController.text,
                                visitorMobile: _phoneController.text,
                                qualifications: _qualificationController.text,
                                bookTitle: _addressController.text,
                                authorName: _authorNameController.text,
                                publisherName: _namePublisherController.text,
                                placeOfPublication: _placePublisherController.text,
                                yearOfPublication: _yearPublishController.text,
                                standardBookNumber: _standardNumberController.text,
                                additionalInformation: _addtionalInfoController.text,
                              );

                            }
                          },
                          title: "addOne".tr,
                          color: kPrimaryColor,
                          image: "assets/image/rightsah.png",
                        ),
                      ): const LoadingFadingCircle(),
                    ],
                  ),
                ),
              );
            },
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
}
