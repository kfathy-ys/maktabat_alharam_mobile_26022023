import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/auth/login/view.dart';
import 'package:maktabat_alharam/screens/drawer/page/about_library/view.dart';
import 'package:maktabat_alharam/screens/drawer/page/contect_us/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/view.dart';
import 'package:maktabat_alharam/screens/our_services/view.dart';
import 'page/languages/view.dart';
import 'page/profile/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

// double height = MediaQuery.of(context).size.height;
// double width = MediaQuery.of(context).size.width;
Widget drawer({required context}) {
  return
      // context.locale == Locale('en', 'US')
      //   ?
      Container(
          margin: const EdgeInsets.only(bottom: 40, top: 65),
          child: Drawer(
            shape:
               const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd:Radius.circular(50) ,
                        bottomEnd:Radius.circular(50) ,
                    )),

            backgroundColor: kDrawerBackText,
            child: Row(
              children: [
                const SizedBox(
                  width: 12,
 /// TODo:: Problem width: 12
                 // width: 12,
                ),
                Container(
                  width: 3,
                  color: kBackgroundButton,
                  height: MediaQuery.of(context).size.height - 180,
                ),
                SizedBox(

                  /// Todo :::   width: MediaQuery.of(context).size.width - 122,
                  width: MediaQuery.of(context).size.width - 122,
                  child: ListView(
                    children: [




                      Get.locale == const Locale('ar','EG') ?
                      Align(
                        alignment: Alignment.topLeft,
                        child:
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 25,),
                            child: InkWell(
                                onTap: () => Get.back(),
                                child: Image.asset(
                                  'assets/image/left arrow.png',
                                  scale: 0.6,
                                )),
                          ),

                      ):Align(
                        alignment: Alignment.topRight,
                        child:  Padding(
                            padding: const EdgeInsets.only(top: 25,),
                            child: InkWell(
                                onTap: () => Get.back(),
                                child: Image.asset(

                                  'assets/image/right arrow.png',
                                  scale: 0.6,

                                )),
                          ),

                      ),
                      listTile(
                          onTap: () {
                            Get.back();
                            Get.to(()=>const AboutLibraryScreen());
                          },
                          title: 'aboutLibrary'.tr,
                          image: 'assets/image/QuestionCircleFill.png'),
               /*       listTile(
                          onTap: () {},
                          title: "generalMare".tr,
                          image: 'assets/image/telegram.png'),
                      listTile(
                          onTap: () {


                          },
                          title: "newLibrary".tr,
                          image: 'assets/image/newest.png'),*/
                      listTile(
                          onTap: () {

                            Get.back();
                            Get.to(()=>OurServicesScreen());

                          },
                          title: "servicesLibrary".tr,
                          image: 'assets/image/pubilcservies.png'),
                      listTile(
                          onTap: () {

                            Get.back();
                            Get.to(()=>const MyOrdersScreen());
                          },
                          title: "myOrders".tr,
                          image: 'assets/image/myorder.png'),
                      listTile(
                          onTap: (){
                            Get.back();
                            Get.to(()=>const ProfileScreen());

                          },
                          title: "myProfile".tr,
                          image: 'assets/image/profileiconr.png'),
                      listTile(
                          onTap: () {
                            Get.back();
                            Get.to(()=>ContactUsScreen());
                          },
                          title: "contactsUs".tr,
                          image: 'assets/image/TelephoneFill.png'),
                      listTile(
                          onTap: () {
                            Get.back();
                            Get.to(()=>LanguagesScreen());
                          },
                          title: "languages".tr,
                          image: 'assets/image/lang.png'),
                  /*    listTile(
                          onTap: () {

                            Get.back();
                            Get.to(()=>SettingsScreen());
                          },
                          title: "settingsV".tr,
                          image: 'assets/image/settings.png'),*/
                      listTile(
                          onTap: () {
                            Get.back();
                            Get.to(()=>LoginScreen());
                          },
                          title: "logout".tr,
                          image: 'assets/image/exit.png'),
                    ],
                  ),
                ),
              ],
            ),
          ));
}

Padding listTile(
    {required VoidCallback onTap,
    required String image,
    required String title}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      //'assets/image/QuestionCircleFill.png'  'About libarary'

      leading: Image.asset(
        image,
        scale: 0.7,
      ),
      title: Text(title,
          style: const TextStyle(
              color: kRoundBorderColor,
              fontSize: 16,
              fontFamily: 'NeoSansBold')),
      onTap: onTap,
    ),
  );
}

Text endTitle({String? endTitle}) {
  return Text(
    endTitle!,
    style: const TextStyle(
        fontFamily: 'Contrail',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: kTextColor),
  );
}

Text textDescriptions({String? text}) {
  return Text(
    text!,
    style: const TextStyle(
        fontFamily: 'Contrail',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor),
  );
}
