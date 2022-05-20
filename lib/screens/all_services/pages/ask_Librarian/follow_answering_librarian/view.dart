import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/model/models.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/drop_down_order_ask_type.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:queen/validation/it/is_email.dart';
import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

import 'cubit/follow_cubit.dart';

// ignore: must_be_immutable
class FollowAnsweringLibrarian extends StatelessWidget {
  final AskMyOrder askMyOrder;

  const FollowAnsweringLibrarian({Key? key, required this.askMyOrder})
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
          body: SizedBox(
            height: height,
            width: width,
            child: BlocProvider(
              create: (context) => FollowCubit(askMyOrder: askMyOrder),
              child: BlocConsumer<FollowCubit, FollowState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = BlocProvider.of<FollowCubit>(context);
                  return Form(
                    key: cubit.formKey,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        HeadTopics(
                          title: "askStaff".tr,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        DropDownAskType(
                          onChanged: cubit.askTypeChanged,
                          initial: cubit.initial,
                        ),
                        CustomTextField(
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
                          hint: "phone".tr,
                          dIcon: Icons.phone,
                          label: "phone".tr,
                          controller: cubit.phoneController,
                          validator: qValidator([
                            IsRequired("phone".tr),
                            IsOptional(),
                            MaxLength(30),
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
                        CustomHeightTextField(
                          hint: "answer".tr,
                          text: "answer".tr + ' :',
                          controller: cubit.responseController,
                          validator: qValidator([
                            IsRequired("answer".tr),
                            IsOptional(),
                            MaxLength(30),
                          ]),
                          type: TextInputType.text,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
