import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/page/views/header.dart';
import 'package:maktabat_alharam/screens/drawer/page/settings/page/views/data_created.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomTextFieldSizer.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget{


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countyController = TextEditingController();
  final _noAccessController = TextEditingController();
  final _passController = TextEditingController();


  SettingsScreen({Key? key}) : super(key: key);

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
          key: _scaffoldKey,
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderTitle(icon: Icons.settings, title: "settingsV".tr),
              SizedBox(height: height*0.06,),

               CustomTextFieldSizer(
                titleTextField: "userNameDots".tr,
                hint:  "fakeName".tr,
                controller: _nameController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your county";
                  }
                },
                type: TextInputType.name,
              ),
               CustomTextFieldSizer(
                 titleTextField: "emailDots".tr,
                 hint: "Mohamed.Rashad@gmail.com",
                 controller: _emailController,
                 validator: (String? value) {
                   if (value!.isEmpty) {
                     return "Please enter your county";
                   }
                 },
                 type: TextInputType.emailAddress,
               ),
               CustomTextFieldSizer(
                 titleTextField: "phoneDots".tr,

                 hint: "6555333777",
                 controller: _phoneController,
                 validator: (String? value) {
                   if (value!.isEmpty) {
                     return "Please enter your phone";
                   }
                 },
                 type: TextInputType.phone,

               ),
               CustomTextFieldSizer(
                 titleTextField: "countryDots".tr,
                 hint:  "saudi".tr,
                 controller: _countyController,
                 validator: (String? value) {
                   if (value!.isEmpty) {
                     return "Please enter your county";
                   }
                 },
                 type: TextInputType.text,
               ),
               CustomTextFieldSizer(
                 titleTextField: "AccessNumberDots".tr,
                 hint: "859632110",

                 controller: _noAccessController,
                 validator: (String? value) {
                   if (value!.isEmpty) {
                     return "Please enter Access no.";
                   }
                 },
                 type: TextInputType.number,
               ),
               CustomTextFieldSizer(
                 titleTextField:  "passwordDots".tr,
                 icon: Icons.lock_outline,
                 dIcon: Icons.lock_outline,
                 controller: _passController,
                 validator: (String? value) {
                   if (value!.isEmpty) {
                     return "Please enter your password";
                   }
                 },
                 type: TextInputType.phone,
               ),
               SizedBox(height: height*0.05,),
               Image.asset("assets/image/smallarrow.png"),
               Text("dataRegister".tr,
                  style: const TextStyle(
                      color: kSmallIconColor,
                      fontSize: 18,
                      fontFamily: 'DinLight')),

               DateCreated(typeDate:"hijri".tr, date: "15-5-1443"),
               DateCreated(typeDate:   "century".tr, date: "15-5-2022")




            ],
          ),
        ),
      ),
    );
  }
}
