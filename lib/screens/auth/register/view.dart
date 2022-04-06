import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:maktabat_alharam/screens/auth/login/view.dart';
import 'package:maktabat_alharam/screens/auth/vcode/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/donotHave.dart';
class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();

   final _passController = TextEditingController();
   final _confirmPassController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          key: _scaffoldKey,
          body: SingleChildScrollView(
            /// TODO:: To Check Keyboard
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,

                children: [
                  SizedBox(height: height*0.05,),
                InkWell(
                  onTap: ()=>Get.back(),
                  child:  Container(
                  margin: const EdgeInsetsDirectional.only(start: 280),
                  child:  Image.asset("assets/image/backbutton.png"),
                ),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customBoldText("welcome".tr),
                      customLightText("createNewAccount".tr)
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  CustomTextField(
                    dIcon: Icons.drive_file_rename_outline,
                    label:"fullName".tr ,
                    hint: "fullName".tr,
                    controller: _idController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your full name";
                      }

                    },
                    type: TextInputType.name,
                  ),
                  CustomTextField(

                    hint: "userName".tr,
                    dIcon: Icons.drive_file_rename_outline,
                    label:"userName".tr ,
                    controller: _emailController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your name";
                      }
                    },
                    type: TextInputType.name,

                  ),
                  CustomTextField(
                    dIcon: Icons.email,
                    label:"email".tr ,
                    hint: "email".tr,
                    controller: _idController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      }

                    },
                    type: TextInputType.emailAddress,
                  ),
                /*  CustomTextField(
                    dIcon: Icons.home_work_rounded,
                    label:"countryResidence".tr ,
                    hint: "countryResidence".tr,
                    controller: _idController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your id";
                      }

                    },
                    type: TextInputType.text,
                  ),
                  CustomTextField(

                    hint: "phone".tr,
                    dIcon: Icons.phone,
                    label:"phone".tr ,
                    controller: _emailController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your phone";
                      }
                    },
                    type: TextInputType.phone,

                  ),*/
                  CustomTextField(

                    hint: "password".tr,
                    icon: Icons.lock_outline,
                    dIcon: Icons.lock_outline,
                    label:"password".tr ,
                    controller: _passController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter a password";
                      }
                    },
                    type: TextInputType.phone,

                  ),
                  CustomTextField(

                    hint: "confirmPass".tr,
                    icon: Icons.lock_outline,
                    dIcon: Icons.lock_outline,
                    label:"confirmPass".tr ,
                    controller: _confirmPassController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter a confirm password";
                      }
                    },
                    type: TextInputType.number,

                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),

                    child: IntlPhoneField(

                      decoration:  InputDecoration(
                          labelStyle:  const TextStyle(
                            fontSize: 16,
                            color: kPrimaryColor,
                            fontFamily: "DinReguler",
                          ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kPrimaryColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      initialCountryCode: 'SA',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (country) {
                        print('Country changed to: ' + country.name);
                      },
                    ),
                  ),
                  CustomButton(color: kSmallIconColor,title:"createAccount".tr ,onPressed: ()=> Get.offAll(()=>MyHomeScreen()),),
                  DoNotHave(
                    text: "login".tr,
                    route: () => Get.to(()=>LoginScreen()),
                    have: "doHave".tr,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
