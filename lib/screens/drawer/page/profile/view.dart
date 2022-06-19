import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/cubit/input_data.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/cubit/user_info_cubit.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/models/model.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/page/views/header.dart';
import 'package:maktabat_alharam/screens/drawer/page/settings/page/views/data_created.dart';
import 'package:maktabat_alharam/screens/widgets/alerts.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mediaButton.dart';
import 'package:maktabat_alharam/screens/widgets/pick_image.dart';
import 'package:maktabat_alharam/screens/widgets/profile_pick_image.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:queen/validation.dart';

import '../../../auth/login/model/models.dart';
import '../../../home/view.dart';
import '../../../widgets/loading.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final firstNameController = TextEditingController();
  final countryController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateController = TextEditingController();
  final arabicFullNameController = TextEditingController();

  void getUserData() {
    _profileInputData.firstName = Prefs.getString('firstName');
    _profileInputData.lastName = Prefs.getString('lastName');
    _profileInputData.email = Prefs.getString('email');
    _profileInputData.nameArabic = Prefs.getString('fullName');
    _profileInputData.phoneNumber = Prefs.getString('phoneNumber');

    /// TODO :: Cache Image
    _profileInputData.profilePic = image;

    firstNameController.text = Prefs.getString('firstName');
    lastNameController.text = Prefs.getString('lastName');
    emailController.text = Prefs.getString('email');
    arabicFullNameController.text = Prefs.getString('fullName');
    phoneController.text = Prefs.getString('phoneNumber');
    setState(() {});
  }

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  // dynamic image = "assets/image/kabah.png";
  final _profileInputData = UpdateProfileInputData();

  dynamic image =
      "https://media.istockphoto.com/photos/kaaba-in-mecca-picture-id482206266?k=20&m=482206266&s=612x612&w=0&h=JvXTR5ih-ieBNh2MXfyBFU8_BAvgUH_m-NUx1m8RpPc=";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => UserInfoCubit(),
      child: BlocConsumer<UserInfoCubit, UserInfoState>(
        listener: (context, state) {
          if (state is UserInfoSuccess) {
            Alert.success("تم التعديل");

            Get.offAll(() => const HomeTabScreen());
          } else if (state is UserInfoError) {
            Alert.error(state.msg.toString());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<UserInfoCubit>(context);

          return Form(
            key: formKey,
            child: SizedBox(
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderTitle(icon: Icons.person, title: "myProfile".tr),
                    _profilePic(userName: "fakeName".tr),
                    CustomTextField(
                      dIcon: Icons.person,
                      label: "firstName".tr,
                      hint: "firstName".tr,
                      controller: firstNameController,
                      validator: qValidator([
                        IsRequired("enterFullName".tr),
                        IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.name,
                      onsave: (String? value) {
                        _profileInputData.firstName = value;
                      },
                    ),
                    CustomTextField(
                      dIcon: Icons.person,
                      label: "lastName".tr,
                      hint: "lastName".tr,
                      controller: lastNameController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired".tr),
                        IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.name,
                      onsave: (String? value) {
                        _profileInputData.lastName = value;
                      },
                    ),
                    CustomTextField(
                      dIcon: Icons.drive_file_rename_outline,
                      label: "arabicFullName".tr,
                      hint: "arabicFullName".tr,
                      controller: arabicFullNameController,
                      validator: qValidator([
                        IsRequired("enterFullName".tr),
                        IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.name,
                      onsave: (String? value) {
                        _profileInputData.nameArabic = value;
                      },
                    ),
                    CustomTextField(
                      hint: "userName".tr,
                      dIcon: Icons.person,
                      label: "userName".tr,
                      controller: arabicFullNameController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired".tr),
                        MaxLength(30),
                      ]),
                      type: TextInputType.text,
                      onsave: (String? value) {
                        _profileInputData.userName = value;
                      },
                    ),
                    CustomTextField(
                      dIcon: Icons.email,
                      label: "email".tr,
                      hint: "email".tr,
                      controller: emailController,
                      validator: qValidator([
                        IsRequired("enterEmail".tr),

                        IsEmail("MustBeEmail".tr),
                        MaxLength(30),
                      ]),
                      type: TextInputType.emailAddress,
                      onsave: (String? value) {
                        _profileInputData.email = value;
                      },
                    ),
                    CustomTextField(
                      dIcon: Icons.real_estate_agent,
                      label: "countryResidence".tr,
                      hint: "countryResidence".tr,
                      controller: countryController,
                      validator: qValidator(
                        [
                          IsRequired("enterCountry".tr),

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
                      controller: passController,
                      validator: qValidator([
                        IsRequired("enterPassword".tr),

                        MinLength(6, "minPassword".tr),
                        MaxLength(30),
                      ]),
                      type: TextInputType.text,
                    ),
                    CustomTextField(
                      hint: "phoneNumber".tr,
                      dIcon: Icons.phone,
                      label: "phoneNumber".tr,
                      controller: phoneController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired".tr),


                        MinLength(6, ),
                        MaxLength(30),
                      ]),
                      type: TextInputType.phone,
                      onsave: (String? value) {
                        _profileInputData.phoneNumber = value;
                      },
                    ),
                    SizedBox(
                        height: height * 0.02,
                        child: Image.asset("assets/image/smallarrow.png")),
                    state is! UserInfoLoading
                        ? Center(
                            child: MediaButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.updatedUserInfo(
                                    userDate: _profileInputData);
                              }
                            },
                            title: "save".tr,
                            color: kSafeAreasColor,
                          ))
                        : const LoadingFadingCircle(),
                    Center(
                      child: Text("dataRegister".tr,
                          style: const TextStyle(
                              color: kSmallIconColor,
                              fontSize: 18,
                              fontFamily: 'DinLight')),
                    ),
                    DateCreated(typeDate: "hijri".tr, date: "15-5-1443"),
                    DateCreated(typeDate: "century".tr, date: "15-5-2022"),
                    SizedBox(
                      height: height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );


  }

  Widget _profilePic({required String userName}) {
    return profilePicContainer(context, image, userName, "changeImage".tr, () {
      openImagePicker(
          context: context,
          onCameraTapped: () {
            _getPic(context, ImageSource.camera);
          },
          onGalleryTapped: () {
            _getPic(context, ImageSource.gallery);
          });
    }, false);
  }

  final ImagePicker _picker = ImagePicker();

  void _getPic(
    BuildContext context,
    ImageSource source,
  ) async {
    final pickedFile = await _picker.getImage(
      source: source,
      maxWidth: 400,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
        _profileInputData.profilePic = File(pickedFile.path);
      });
      Navigator.pop(context);
      FocusScope.of(context).unfocus();
    }
  }
}
