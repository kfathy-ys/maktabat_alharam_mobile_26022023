import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/page/views/header.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:queen/core/helpers/prefs.dart';


// ignore: must_be_immutable
class LanguagesScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  LanguagesScreen({Key? key}) : super(key: key);

  final List locale =[
    {'name':'العربية','locale': const Locale('ar','EG')},
    {'name':'ENGLISH','locale': const Locale('en','US')},


  ];
  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);

  }

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
            //  press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body: SizedBox(
            height: height,
            width: width,
            child: ListView(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderTitle(icon: Icons.language, title: "language".tr),
                Image.asset("assets/image/bigKabah.png"),

                CustomButton(color: kSafeAreasColor,onPressed: (){
                  buildLanguageDialog(context);
                 Prefs.getString("saveLang");
                 // Prefs.setString("saveLang", "saveLang");
                  },
                title: "changeLang".tr,

                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  buildLanguageDialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){

        return  CupertinoAlertDialog(
            title:  Text(
              'choosePreferredLanguage'.tr,
              style: const TextStyle(
                  fontFamily: 'DinBold',
                  fontSize: 16,
                  color: kPrimaryColor),
            ),
            content: SizedBox(
              height: 100, // Change as per your requirement
              width: 300.0,
              child: ListView.separated(

                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name'],
                        style: const TextStyle(
                            fontFamily: 'DinMedium',
                            fontSize: 14,
                            color: kBlackText),

                      ),onTap: (){
                        log(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                        // Prefs.getString("saveLang");
                   Prefs.setString("saveLang", "saveLang");

                      },),
                    );
                  }, separatorBuilder: (context,index){
                return const Divider(
                  color: kAccentColor,
                );
              }, itemCount: locale.length
              ),
            )

          );

        }
    );
  }

}
