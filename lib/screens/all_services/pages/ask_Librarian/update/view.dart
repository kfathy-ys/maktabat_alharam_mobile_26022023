
import 'package:flutter/material.dart';
import '../follow_answering_librarian/page/views/drop_down_items.dart';
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
  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _questionController = TextEditingController();


  UpdatesAskLibrarian({Key? key}) : super(key: key);

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
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 18),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                HeadTopics(
                  title: "askStaff".tr,
                ),
                buildSizedBox(height),
                const DropDownList(),
                CustomTextField(
                  hint: "userName".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label: "userName".tr,
                  controller: _userController,
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
                  type: TextInputType.phone,
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
                Center(
                    child: MediaButtonSizer(
                  onPressed: () {
                       Get.to(()=>MyOrderAskLibrarian());
                  },
                  title: "save".tr,
                  color: kPrimaryColor,
                  image: "assets/image/rightsah.png",
                ))
              ],
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
