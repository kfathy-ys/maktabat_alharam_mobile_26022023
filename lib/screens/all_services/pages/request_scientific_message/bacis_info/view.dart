import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/bacis_info/cubit/all_uni_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/bacis_info/page/drop_down_university_name.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/bacis_info/page/title.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/message_data/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';

import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

import '../message_files/cubit/messages_input.dart';

// ignore: must_be_immutable
class BasicInfoScreen extends StatefulWidget {

  const BasicInfoScreen({Key? key}) : super(key: key);

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final uniController = TextEditingController();

  final depController = TextEditingController();

  final phoneController = TextEditingController();


  bool value = false;
  MessagesFilesInputData filesInputData = MessagesFilesInputData();

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
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      appBar: customAppbar(
          icons: Icons.arrow_forward_outlined,
          isIcons: true,
          context: context),
      body: Form(
        key:formKey ,
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeadTitle(
                  title: "DepositScientificThesis".tr,
                  subTitle: "basicInfoArrow".tr,
                ),
                buildSizedBox(height),
                CustomTextField(
                  hint: "userName".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "userName".tr,
                  controller: nameController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),

                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                  onsave: (String? value) {
                    filesInputData.userName = value;
                  },
                ),
                BlocProvider(
                  create: (context) => AllUniCubit(),
                  child: BlocConsumer<AllUniCubit, AllUniState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      final cubit= BlocProvider.of<AllUniCubit>(context);
                      return DropDownListUniversityName(
                        onChanged: (value) {
                          print(value.id.toString());
                          print(value.nameAr.toString());
                          filesInputData.universityId = value.id.toString();
                          cubit.onUniTypeChanged(value);

                        },
                      );
                    },
                  ),
                ),
                CustomTextField(
                  hint: "collage".tr,
                  dIcon: Icons.flag_outlined,
                  label: "collage".tr,
                  controller: uniController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),

                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                  onsave: (String? value) {

                    filesInputData.faculty = value ;
                  },
                ),
                CustomTextField(
                  hint: "email".tr,
                  dIcon: Icons.email,
                  label: "email".tr,
                  controller: emailController,
                  validator: qValidator([
                    IsRequired("enterEmail".tr),

                    MaxLength(30),
                  ]),
                  type: TextInputType.emailAddress,
                  onsave: (String? value) {
                    filesInputData.email = value;
                  },
                ),
                CustomTextField(
                  hint: "department".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "department".tr,
                  controller: depController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),

                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                  onsave: (String? value) {
                    filesInputData.department = value;
                  },
                ),
                CustomTextField(
                  hint: "phoneNumber".tr,
                  dIcon: Icons.phone,
                  label: "phoneNumber".tr,
                  controller: phoneController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),

                    MaxLength(30),
                  ]),
                  type: TextInputType.phone,
                  onsave: (String? value) {
                    filesInputData.phoneNumber = value;
                  },
                ),
                buildSizedBox(height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmallestButton(
                      onPressed: () {
                        Get.back();
                      },
                      title: "previous".tr,
                      color: kPrimaryColor,
                      image: "assets/image/twoarrowleft.png",
                    ),
                    SmallestButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){

                        }
                        Get.to(() =>  MessageDataScreen(filesInputData));
                      },
                      title: "next".tr,
                      color: kPrimaryColor,
                      image: "assets/image/twoarrowright.png",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
                height: height * 0.04,
              );
  }

  ListTile buildListTile(
      {required Color color, required String title, required String image}) {
    return ListTile(
      horizontalTitleGap: 1,
      //"fillOut".tr
      title: Text(title,
          style:
          TextStyle(color: color, fontSize: 14, fontFamily: 'DinReguler')),
      //"assets/image/dot.png"
      leading: Image.asset(image),
    );
  }



}
