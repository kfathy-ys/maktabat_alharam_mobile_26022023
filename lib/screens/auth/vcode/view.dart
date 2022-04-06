import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/auth/new_password/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
class VCodeScreen extends StatelessWidget {
  VCodeScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();


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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: height*0.05,),
                  InkWell(
                    onTap: ()=>Get.back(),
                    child:  Container(
                      margin: const EdgeInsetsDirectional.only(start: 280),
                      child:  Image.asset("assets/image/backbutton.png"),
                    ),),
                  SizedBox(height: height*0.3,),
                  CustomTextField(

                    hint: "EnterVcode".tr,
                    dIcon: Icons.verified_user_outlined,
                    label:"EnterVcode".tr ,
                    controller: _emailController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter a verify code";
                      }
                    },
                    type: TextInputType.emailAddress,

                  ),
                  SizedBox(height: height*0.05,),
                  CustomButton(color: kSmallIconColor,title:"confirm".tr ,onPressed: ()=>Get.to(()=>NewPasswordScreen()),),
                  SizedBox(height: height*0.01,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
