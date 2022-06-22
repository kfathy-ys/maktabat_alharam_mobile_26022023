import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/auth/vcode/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(start: 280),
                      child: Image.asset("assets/image/backbutton.png"),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                  /*  CustomTextField(
                    dIcon: Icons.phone,
                    label:"phone".tr ,
                    hint: "phone".tr,
                    controller: _idController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your id";
                      }

                    },
                    type: TextInputType.number,
                  ),*/
                  CustomTextField(
                    hint: "email".tr,
                    dIcon: Icons.email,
                    label: "email".tr,
                    controller: _emailController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomButton(
                    color: kSmallIconColor,
                    title: "sendCode".tr,
                    onPressed: () => Get.to(() => const VCodeScreen()),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const VCodeScreen()),
                    child: Text(
                      "resend".tr,
                      style: const TextStyle(
                          color: kSkyButton,
                          fontSize: 16,
                          fontFamily: 'DinReguler'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
