import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/page/views/drop_down_items.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/cubit/my_order_ask_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/new_order/cubit/new_order_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/alart.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';

import 'package:queen/validation.dart';

import '../../../widgets/alerts.dart';
import 'page/views/drop_down_order_ask_type.dart';

// ignore: must_be_immutable
class AskLibrarian extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _questionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AskLibrarian({Key? key}) : super(key: key);

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
          body: BlocConsumer<NewOrderAskCubit, NewOrderState>(
            listener: (context, state) {
              if (state is NewOrderSuccess) {
                Alert.success( "تم إضافة طلبك بنجاح");
                BlocProvider.of<MyOrderAskCubit>(context).getOrderAsk();
              Get.off(() => MyOrderAskLibrarian());
              } else if (state is NewOrderError) {
                Alert.error( state.msg);
              }
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<NewOrderAskCubit>(context);
              return SizedBox(
                height: height,
                width: width,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    physics: const BouncingScrollPhysics(),

                    children: [
                      HeadTopics(
                        title: "askStaff".tr,
                      ),
                      buildSizedBox(height),
                      DropDownAskType(
                        onChanged: cubit.askTypeChanged,
                      ),
                      CustomTextField(
                        hint: "userName".tr,
                        dIcon: Icons.drive_file_rename_outline,
                        label: "userName".tr,
                        controller: _nameController,
                        validator: qValidator([
                          IsRequired("enterName".tr),
                          IsOptional(),
                          MaxLength(30),
                        ]),
                        type: TextInputType.name,
                      ),
                      CustomTextField(
                        dIcon: Icons.email,
                        label: "email".tr,
                        hint: "email".tr,
                        controller: _emailController,
                        validator: qValidator([
                          IsRequired("enterEmail".tr),
                          IsOptional(),
                          IsEmail("MustBeEmail".tr),
                          MaxLength(30),
                        ]),
                        type: TextInputType.emailAddress,
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
                        type: TextInputType.text,
                      ),
                      CustomHeightTextField(
                        hint: "question".tr,
                        text: "question".tr + ' :',
                        controller: _questionController,
                        validator: qValidator([
                          IsRequired("question".tr),
                          IsOptional(),
                          MaxLength(80),
                        ]),
                        type: TextInputType.text,
                      ),
                      buildSizedBox(height),
                      state is! NewOrderLoading
                          ? Center(
                              child: MediaButtonSizer(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()){
                                    cubit.createOrderAskLib(
                                      visitorName: _nameController.text,
                                      visitorEmail: _emailController.text,
                                      visitorMobile: _phoneController.text,
                                      visitorMessage: _questionController.text,
                                    );
                                  }
                                },
                                title: "طلب الخدمة",
                                color: kPrimaryColor,
                                image: "assets/image/rightsah.png",
                              ),
                            )
                          : const LoadingFadingCircle()
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

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.05,
      );
}
