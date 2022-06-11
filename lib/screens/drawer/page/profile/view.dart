import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/cubit/user_info_cubit.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/models/model.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/page/views/header.dart';
import 'package:maktabat_alharam/screens/drawer/page/settings/page/views/data_created.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mediaButton.dart';
import 'package:maktabat_alharam/screens/widgets/pick_image.dart';
import 'package:maktabat_alharam/screens/widgets/profile_pick_image.dart';
import 'package:queen/validation.dart';

import '../../../widgets/loading.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  UserModel? userModel;

   ProfileScreen({Key? key , this.userModel}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();
  final _arabicFullNameController = TextEditingController();

  final _birthDateController = TextEditingController();

  dynamic image = "assets/image/kabah.png";

  //dynamic image = "https://media.istockphoto.com/photos/kaaba-in-mecca-picture-id482206266?k=20&m=482206266&s=612x612&w=0&h=JvXTR5ih-ieBNh2MXfyBFU8_BAvgUH_m-NUx1m8RpPc=";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
   // double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => UserInfoCubit(widget.userModel!),
      child: BlocConsumer<UserInfoCubit ,UserInfoState>(
        listener: (context, state){},
        builder: (context, state){
          final cubit = BlocProvider.of<UserInfoCubit>(context);

          if (state is UserInfoLoading) {
            return const LoadingFadingCircle();
          }
          if (state is UserInfoError) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              //  padding: const EdgeInsets.symmetric(horizontal: 19),
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderTitle(icon: Icons.person, title: "myProfile".tr),
                _profilePic(userName: "fakeName".tr),
                CustomTextField(
                  dIcon: Icons.person,
                  label:"firstName".tr ,
                  hint: "firstName".tr,
                  controller: cubit.firstNameController,
                  validator: qValidator([
                    IsRequired("enterFullName".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  dIcon: Icons.person,
                  label:"lastName".tr ,
                  hint: "lastName".tr,
                  controller: cubit.lastNameController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  dIcon: Icons.drive_file_rename_outline,
                  label:"arabicFullName".tr ,
                  hint: "arabicFullName".tr,
                  controller: cubit.arabicFullNameController,
                  validator: qValidator([
                    IsRequired("enterFullName".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  dIcon: Icons.email,
                  label:"email".tr ,
                  hint: "email".tr,
                  controller: cubit.emailController,
                  validator: qValidator([
                    IsRequired("enterEmail".tr),
                    IsOptional(),
                    IsEmail("MustBeEmail".tr),
                    MaxLength(30),
                  ]),
                  type: TextInputType.emailAddress,
                ),

                CustomTextField(

                  hint: "date".tr,

                  dIcon: Icons.calendar_today,
                  label:"date".tr ,
                  controller: cubit.dateController,
                  validator:qValidator([
                    IsRequired("enterConfPassword".tr),
                    IsOptional(),

                    MinLength(10, ),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,

                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),

                  child: IntlPhoneField(
                    controller:cubit.phoneController ,

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
                      log(phone.completeNumber);
                    },

                    onCountryChanged: (country) {
                      log('Country changed to: ' + country.name);
                    },
                  ),
                ),

                SizedBox(
                    height: height*0.02,
                    child: Image.asset("assets/image/smallarrow.png")),
                MediaButton(onPressed: (){}, title: "save".tr,color: kSafeAreasColor,),
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
            );
          }
          if (state is UserInfoError) {
            return Center(child: Text(state.msg));
          }
          if (state is UserInfoEmpty) {
            print("Empty");
            return Center(
                child: customBoldText(title: "لا توجد طلبات الاّن"));
          }
          return const SizedBox();
        },

      ),
    );
  }

  Widget _profilePic({required String userName}) {

    return profilePicContainer(context,image,userName,"changeImage".tr,() {

      openImagePicker(

          context: context,
          onCameraTapped: () {
            _getPic(context, ImageSource.camera);
          },
          onGalleryTapped: () {
            _getPic(context, ImageSource.gallery);
          });
    },
        false);

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
      });
      Navigator.pop(context);
      FocusScope.of(context).unfocus();
    }
  }
}
