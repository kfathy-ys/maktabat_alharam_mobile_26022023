import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/auth/forget_password/view.dart';
import 'package:maktabat_alharam/screens/auth/login/page/recovery_password.dart';
import 'package:maktabat_alharam/screens/auth/register/view.dart';
import 'package:maktabat_alharam/screens/home/view.dart';
import 'package:maktabat_alharam/screens/widgets/alart.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/donotHave.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:queen/validation/it/is_email.dart';
import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/text/min_length.dart';
import 'package:queen/validation/validator.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {

   final  _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                 Prefs.setString('token', state.model.data!.token!);

               alertWithSuccess(context, state.model.messages.toString());

                Get.offAll(() => const HomeTabScreen());
              } else if (state is LoginError ) {
               // alertWithErr(context, state.model.messages.toString());
                alertWithErr(context, state.model.messages.toString());

              }
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<LoginCubit>(context);
              return Scaffold(
                backgroundColor: kHomeColor,
         //  key: _scaffoldKey,
                body: SingleChildScrollView(
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/image/kabah.png'),
                          customBoldText("welcome".tr),
                          customLightText("signIn".tr),
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

                            type: TextInputType.phone,
                          ),
                          RecoveryWidget(
                            onTap: () => Get.to(() => ForgetPassword()),
                          ),
                          state is! LoginLoading ?    CustomButton(
                            color: kSafeAreasColor,
                            title: "signIn".tr,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              }
                            },
                          ):  const LoadingFadingCircle(),
                          /*       Text(
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
                    ),*/
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
              );
            },
          ),
        ),
      ),
    );
  }
}
