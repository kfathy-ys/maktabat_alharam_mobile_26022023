import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _newPassController = TextEditingController();
  final _confirmPssController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(

          backgroundColor: kHomeColor,
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
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

                    hint: "newPassword".tr,
                    icon: Icons.lock_outline,
                    dIcon: Icons.lock_outline,
                    label:"newPassword".tr ,
                    controller: _newPassController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter a new password";
                      }
                    },
                    type: TextInputType.phone,

                  ),
                  CustomTextField(

                    hint: "confirmPass".tr,
                    icon: Icons.lock_outline,
                    dIcon: Icons.lock_outline,
                    label:"confirmPass".tr ,
                    controller: _confirmPssController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter confirm password";
                      }
                    },
                    type: TextInputType.phone,

                  ),
                  SizedBox(height: height*0.05,),
                  CustomButton(color: kSmallIconColor,title:"save".tr ,onPressed: (){},),
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
