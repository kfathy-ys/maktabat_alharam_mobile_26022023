import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/auth/forget_password/view.dart';
import 'package:maktabat_alharam/screens/auth/login/page/recovery_password.dart';
import 'package:maktabat_alharam/screens/auth/register/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/donotHave.dart';
import 'package:maktabat_alharam/screens/widgets/mediaButton.dart';
import 'package:queen/validation/it/is_email.dart';
import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/text/min_length.dart';
import 'package:queen/validation/validator.dart';

class LoginScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

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
            child: Container(
              height: height,
              width: width,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Image.asset('assets/image/kabah.png'),
                    customBoldText("welcome".tr),
                    customLightText("signIn".tr),
                    CustomTextField(
                      dIcon: Icons.confirmation_number,
                      label: "IdentificationNumber".tr,
                      hint: "IdentificationNumber".tr,
                      controller: _idController,
                      validator: qValidator([
                        IsRequired("enterId".tr),
                        IsOptional(),
                        //const IsEmail(),
                        MinLength(6),
                        MaxLength(30),
                      ]),
                      type: TextInputType.number,
                    ),
                    CustomTextField(
                      hint: "password".tr,
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      label: "password".tr,
                      controller: _passwordController,
                      validator: qValidator([
                        IsRequired("enterPassword".tr),
                        IsOptional(),


                        MinLength(6, "minPassword".tr),
                        MaxLength(30),
                      ]),
                      //     (String? value) {
                      //   if (value!.isEmpty) {
                      //     return "enterPassword".tr;
                      //   }
                      // },
                      type: TextInputType.phone,
                    ),
                    RecoveryWidget(
                      onTap: () => Get.to(() => ForgetPassword()),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomButton(
                      color: kSafeAreasColor,
                      title: "signIn".tr,
                      onPressed: () {

                    if (formKey.currentState!.validate()) {
                      Get.offAll(() => MyHomeScreen());
                            }

                      },
                    ),
                    Text(
                      "orLoginWith".tr,
                      style: const TextStyle(
                          color: kBlackText,
                          fontSize: 14,
                          fontFamily: 'DinMedium'),
                    ),
                    Image.asset('assets/image/arrowdown.png'),
                    MediaButton(
                      onPressed: () {},
                      title: "nationalAccess".tr,
                      color: kSafeAreasColor,
                    ),
                    DoNotHave(
                      text: "signUpNow".tr,
                      route: () => Get.to(() => SignUpScreen()),
                      have: "donHave".tr,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
