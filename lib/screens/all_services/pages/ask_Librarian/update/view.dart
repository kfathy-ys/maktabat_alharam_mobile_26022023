import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/cubit/my_order_ask_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/model/models.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/drop_down_order_ask_type.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/update/cubit/update_ask_lib_cubit.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';
import '../../../../widgets/alerts.dart';
import '../my_order/view.dart';
import '../page/views/head_topices.dart';
import '../../../../drawer/view.dart';
import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import 'package:get/get.dart';
import '../../../../widgets/customHeightTextFiled.dart';
import '../../../../widgets/customTextFeild.dart';
import '../../../../widgets/mdeiaButtonSizer.dart';
import 'package:queen/validation.dart';

class UpdatesAskLibrarian extends StatelessWidget {
  final AskMyOrder askMyOrder;

  const UpdatesAskLibrarian({Key? key, required this.askMyOrder})
      : super(key: key);

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
            create: (context) => UpdateAskLibCubit(askMyOrder),
            child: BlocConsumer<UpdateAskLibCubit, UpdateAskLibState>(
              listener: (context, state) {
                if (state is UpdateAskLibSuccess) {
                  Alert.success("تم التعديل بنجاح");

                  BlocProvider.of<MyOrderAskCubit>(context).getOrderAsk();
                  Get.to(() => MyOrderAskLibrarian());
                }
                if (state is UpdateAskLibError) {
                  Alert.error(state.msg.toString());
                }
              },
              builder: (context, state) {
                final cubit = BlocProvider.of<UpdateAskLibCubit>(context);
                return Form(
                  key: cubit.formKey,
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        HeadTopics(
                          title: "askStaff".tr,
                        ),
                        buildSizedBox(height),
                        DropDownAskType(
                          onChanged: cubit.askTypeChanged,
                          initial: cubit.initial,
                        ),
                        CustomTextField(
                          read: true,
                          hint: "userName".tr,
                          dIcon: Icons.drive_file_rename_outline,
                          label: "userName".tr,
                          controller: cubit.userController,
                          validator: qValidator([
                            IsRequired("enterName".tr),
                            IsOptional(),
                            MaxLength(30),
                          ]),
                          type: TextInputType.name,
                        ),
                        CustomTextField(
                          read: true,
                          dIcon: Icons.email,
                          label: "email".tr,
                          hint: "email".tr,
                          controller: cubit.emailController,
                          validator: qValidator([
                            IsRequired("enterEmail".tr),
                            IsOptional(),
                            IsEmail("MustBeEmail".tr),
                            MaxLength(30),
                          ]),
                          type: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          read: true,
                          hint: "phone".tr,
                          dIcon: Icons.phone,
                          label: "phone".tr,
                          controller: cubit.phoneController,
                          validator: qValidator([
                            IsRequired("phone".tr),
                            //IsOptional(),
                            MinLength(11),
                            MaxLength(14),
                          ]),
                          type: TextInputType.phone,
                        ),
                        CustomHeightTextField(
                          hint: "question".tr,
                          text: "question".tr + ' :',
                          controller: cubit.questionController,
                          validator: qValidator([
                            IsRequired("question".tr),
                            IsOptional(),
                            MaxLength(80),
                          ]),
                          type: TextInputType.text,
                        ),
                        buildSizedBox(height),
                        state is! UpdateAskLibLoading
                            ? Center(
                                child: MediaButtonSizer(
                                onPressed: () async {
                                  if (cubit.formKey.currentState!.validate()) {
                                    await cubit.updatedOrderAsk(
                                      visitorName: cubit.userController.text,
                                      visitorEmail: cubit.emailController.text,
                                      visitorMobile: cubit.phoneController.text,
                                      question: cubit.questionController.text,
                                    );
                                  }
                                },
                                title: "save".tr,
                                color: kPrimaryColor,
                                image: "assets/image/rightsah.png",
                              ))
                            : const LoadingFadingCircle()
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
