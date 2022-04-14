import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customHeightTextFiled.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/mediaButton.dart';
import 'package:maktabat_alharam/screens/widgets/smallButton.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:queen/validation/it/is_email.dart';
import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

import 'page/views/drop_down_items.dart';


// ignore: must_be_immutable
class AskLibrarianNewOrder extends StatelessWidget{


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _questionController = TextEditingController();
  final _responseController = TextEditingController();
  AskLibrarianNewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer:  drawer(context: context) ,
          key: _scaffoldKey,
          appBar:customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body:  Container(
          //  margin:ri const EdgeInsets.symmetric(hozontal: 0,vertical: 10),
            height: height,

            width: width,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 18) ,

            physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children:  [


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                  child: HeadTopics(title: "askLibrarian".tr,),
                ),
                SizedBox(height: height*0.05,),
                DropDownList(),
                CustomTextField(
                  hint: "userName".tr,
                  dIcon: Icons.drive_file_rename_outline,
                  label:"userName".tr ,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired("enterName".tr),
                    IsOptional(),

                    MaxLength(30),
                  ]),
                  type: TextInputType.name,

                ),
                CustomTextField(
                  dIcon: Icons.email,
                  label:"email".tr ,
                  hint: "email".tr,
                  controller: _idController,
                  validator: qValidator([
                    IsRequired("enterEmail".tr),
                    IsOptional(),
                    IsEmail("MustBeEmail".tr),
                    MaxLength(30),
                  ]),
                  type: TextInputType.emailAddress,
                ),
                CustomTextField(
                  hint: "phone".tr,
                  dIcon: Icons.phone,
                  label:"phone".tr ,
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired("phone".tr),
                    IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,

                ),
                 CustomHeightTextField(hint:"question".tr,text: "question".tr+' :',
                  controller: _questionController,
                  validator: qValidator([
                    IsRequired("question".tr),
                    IsOptional(),
                    MaxLength(80),
                  ]),
                  type: TextInputType.text,
                ),
SizedBox(height: height*0.05,),
                Center(child: MediaButtonSizer(
                  onPressed: () {

                }, title: "طلب الخدمة",color: kPrimaryColor,image: "assets/image/rightsah.png",))


              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRow({required String title ,  String? subTitle , Color? color1 , Color? color2 ,}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
            title,
            //  "محتوي الطلب",
//kSmallIconColor
            style:  TextStyle(
                color: color1, fontSize: 14, fontFamily: 'DinBold'
            )
        ),
        Text(

            subTitle!,
            // "هل المكتبة متاحة يوم الجمعة؟",
//kBlackText
            style:  TextStyle(
                color: color2, fontSize: 14, fontFamily: 'DinReguler'
            )
        ),
      ],
    );
  }
}
