import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/auth/forget_password/view.dart';
import 'package:maktabat_alharam/screens/auth/register/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/donotHave.dart';
import 'package:maktabat_alharam/screens/widgets/mediaButton.dart';

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
             child: Form(
               key: formKey,
               child: Container(
                 height: height,
                 width: width,
                 color: Colors.white,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     SizedBox(height: height*0.05,),
                     Image.asset('assets/image/kabah.png'),
                     customBoldText("welcome".tr),
                     customLightText("signIn".tr),
                     CustomTextField(
                       dIcon: Icons.confirmation_number,
                       label:"IdentificationNumber".tr ,
                       hint: "IdentificationNumber".tr,
                       controller: _idController,
                       validator: (String? value) {
                         if (value!.isEmpty) {
                           return "Please enter your id";
                         }

                       },
                       type: TextInputType.number,
                     ),
                     CustomTextField(

                       hint: "password".tr,
                       icon: Icons.lock_outline,
                       dIcon: Icons.lock_outline,
                       label:"password".tr ,
                        controller: _passwordController,
                       validator: (String? value) {
                         if (value!.isEmpty) {
                           return "Please enter your password";
                         }
                       },
                       type: TextInputType.phone,

                     ),
                     Container(

                       margin: const EdgeInsetsDirectional.only(start: 170),
                       child: GestureDetector(
                         onTap:()=> Get.to(()=>ForgetPassword()),
                         child: Text(
                           "passwordRecovery".tr,

                           style: const TextStyle(
                               color: kSkyButton, fontSize: 14, fontFamily: 'DinReguler'
                           )
                           ,),
                       ),
                     ),
                     SizedBox(height: height*0.02,),
                     CustomButton(color: kSafeAreasColor,title:"signIn".tr ,onPressed: (){
                       Get.offAll(()=>MyHomeScreen());
                     },),
                     Text(
                       "orLoginWith".tr,

                       style: const TextStyle(
                           color: kBlackText, fontSize: 14, fontFamily: 'DinMedium'
                       )
                       ,),
                     Image.asset('assets/image/arrowdown.png'),
                     MediaButton(onPressed: (){}, title: "nationalAccess".tr,color: kSafeAreasColor,),
                     DoNotHave(
                       text: "signUpNow".tr,
                       route: () => Get.to(()=>SignUpScreen()),
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
