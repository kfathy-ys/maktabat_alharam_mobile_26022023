import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/auth/login/view.dart';
import 'package:maktabat_alharam/screens/auth/register/page/title_subtitle.dart';

import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/donotHave.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';
import 'package:queen/validation.dart';
import '../../widgets/alerts.dart';
import 'cubit/register_cubit.dart';
import 'page/back_icon.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _userNameController = TextEditingController();
  final _arabicFullNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: BlocProvider(
          create: (context) => RegisterCubit(),
          child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
            if (state is RegisterSuccess) {
              /// TODO : Cached Token needed
              //Prefs.setString('token', state.registerModel.);
              //  Get.offAll(() =>  LoginScreen());
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>  LoginScreen()),
                  (Route<dynamic> route) => false);
              Alert.success('???? ?????????? ??????????');
            } else if (state is RegisterError) {
              Alert.error(state.msg);
            }
          }, builder: (context, state) {
            final cubit = BlocProvider.of<RegisterCubit>(context);
            return Scaffold(
              backgroundColor: kHomeColor,
              body: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const IconBack(),
                    const TextTitleSubTitle(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextField(
                      dIcon: Icons.person,
                      label: "firstName".tr,
                      hint: "firstName".tr,
                      controller: _firstNameController,
                      validator: qValidator([
                        IsRequired("enterFullName".tr),
                       // IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.name,
                    ),
                    CustomTextField(
                      dIcon: Icons.person,
                      label: "lastName".tr,
                      hint: "lastName".tr,
                      controller: _lastNameController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired".tr),
                       // IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.name,
                    ),
                    CustomTextField(
                      dIcon: Icons.drive_file_rename_outline,
                      label: "arabicFullName".tr,
                      hint: "arabicFullName".tr,
                      controller: _arabicFullNameController,
                      validator: qValidator([
                        IsRequired("enterFullName".tr),
                       // IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.name,
                    ),
                    CustomTextField(
                      hint: "userName".tr,
                      dIcon: Icons.person,
                      label: "userName".tr,
                      controller: _userNameController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired".tr),
                      //  IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.text,
                    ),
                    CustomTextField(
                      dIcon: Icons.email,
                      label: "email".tr,
                      hint: "email".tr,
                      controller: _emailController,
                      validator: qValidator([
                        IsRequired("enterEmail".tr),
                       // IsOptional(),
                        IsEmail("MustBeEmail".tr),
                        MaxLength(30),
                      ]),
                      type: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      dIcon: Icons.real_estate_agent,
                      label: "countryResidence".tr,
                      hint: "countryResidence".tr,
                      controller: _countryController,
                      validator: qValidator(
                        [
                          IsRequired("enterCountry".tr),
                       //   IsOptional(),
                          MaxLength(30),
                        ],
                      ),
                      type: TextInputType.streetAddress,
                    ),
                    CustomTextField(
                      hint: "password".tr,
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      label: "password".tr,
                      controller: _passController,
                      validator: qValidator([
                        IsRequired("enterPassword".tr),
                      //  IsOptional(),
                        MinLength(6, "minPassword".tr),
                        MaxLength(30),
                      ]),
                      type: TextInputType.text,
                    ),

                    CustomTextField(
                      hint: "phoneNumber".tr,
                      dIcon: Icons.phone,
                      label: "phoneNumber".tr,
                      controller: _phoneController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired".tr),
                      //  IsOptional(),
                      //  Match("not match"),
                        MinLength(6, "minPassword".tr),
                        MaxLength(30),
                      ]),
                      type: TextInputType.phone,
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 30, vertical: 8),
                    //   child: IntlPhoneField(
                    //
                    //     controller: _phoneController,
                    //     decoration: InputDecoration(
                    //       labelStyle: const TextStyle(
                    //         fontSize: 16,
                    //         color: kPrimaryColor,
                    //         fontFamily: "DinReguler",
                    //       ),
                    //
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: const BorderSide(
                    //             color: kPrimaryColor, width: 1),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: const BorderSide(
                    //             color: kPrimaryColor, width: 2),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderSide: const BorderSide(color: Colors.red),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //     ),
                    //     initialCountryCode: 'SA',
                    //     onChanged: (phone) {
                    //       log(phone.completeNumber);
                    //     },
                    //     onCountryChanged: (country) {
                    //       log('Country changed to: ' + country.name);
                    //     },
                    //   ),
                    // ),
                    state is! RegisterLoading
                        ? CustomButton(
                            color: kSmallIconColor,
                            title: "createAccount".tr,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.userRegister(
                                    country: _countryController.text,
                                    fName: _firstNameController.text,
                                    lName: _lastNameController.text,
                                    fullName: _arabicFullNameController.text,
                                    userName: _userNameController.text,
                                    phone: _phoneController.text,
                                    email: _emailController.text,
                                    password: _passController.text);
                              }
                            })
                        : const LoadingFadingCircle(),
                    DoNotHave(
                      text: "login".tr,
                      route: () => Get.to(() => LoginScreen()),
                      have: "doHave".tr,
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
