import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maktabat_alharam/config/pick.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/page/views/header.dart';
import 'package:maktabat_alharam/screens/drawer/page/settings/page/views/data_created.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomTextFieldSizer.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/pick_image.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _countyController = TextEditingController();

  final _noAccessController = TextEditingController();

  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: drawer(context: context),
          key: _scaffoldKey,
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderTitle(icon: Icons.person, title: "myProfile".tr),
              //  Column(
              //    children: [
              //      CircleAvatar(radius: 50,),
              // Text("fffffff",
              //     style: const TextStyle(
              //         color: kTextFieldColor,
              //         fontSize: 14,
              //         fontFamily: 'DinLight')),
              //    ],
              //  ),

              CustomTextFieldSizer(
                titleTextField: "userNameDots".tr,
                hint: "fakeName".tr,
                controller: _nameController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your county";
                  }
                },
                type: TextInputType.name,
              ),
              CustomTextFieldSizer(
                titleTextField: "emailDots".tr,
                hint: "Mohamed.Rashad@gmail.com",
                controller: _emailController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your county";
                  }
                },
                type: TextInputType.emailAddress,
              ),
              CustomTextFieldSizer(
                titleTextField: "phoneDots".tr,
                hint: "6555333777",
                controller: _phoneController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your phone";
                  }
                },
                type: TextInputType.phone,
              ),
              CustomTextFieldSizer(
                titleTextField: "countryDots".tr,
                hint: "saudi".tr,
                controller: _countyController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your county";
                  }
                },
                type: TextInputType.text,
              ),
              CustomTextFieldSizer(
                titleTextField: "AccessNumberDots".tr,
                hint: "859632110",
                controller: _noAccessController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter Access no.";
                  }
                },
                type: TextInputType.number,
              ),
              CustomTextFieldSizer(
                titleTextField: "passwordDots".tr,
                icon: Icons.lock_outline,
                dIcon: Icons.lock_outline,
                controller: _passController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                },
                type: TextInputType.phone,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Image.asset("assets/image/smallarrow.png"),
              Text("dataRegister".tr,
                  style: const TextStyle(
                      color: kSmallIconColor,
                      fontSize: 18,
                      fontFamily: 'DinLight')),

              DateCreated(typeDate: "hijri".tr, date: "15-5-1443"),
              DateCreated(typeDate: "century".tr, date: "15-5-2022")
            ],
          ),
        ),
      ),
    );
  }

/*  Widget _profilePic() {
    return ProfileContainer(_inputData.image, () {
      openImagePicker(
          context: context,
          onCameraTapped: () {
            _getPic(context, ImageSource.camera);
          },
          onGalleryTapped: () {
            _getPic(context, ImageSource.gallery);
          });
    });
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
        _inputData.image = File(pickedFile.path);
      });
      Navigator.pop(context);
      FocusScope.of(context).unfocus();
    }
  }*/
}
