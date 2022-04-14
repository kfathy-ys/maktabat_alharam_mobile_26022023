import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/auth/login/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/content.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/sliders/banner_slider.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/sliders/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/title_subTitle.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/to_show_more_about_our_services.dart';
import 'package:maktabat_alharam/screens/our_services/page/views/suggest_bug_book.dart';
import 'package:maktabat_alharam/screens/our_services/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';

import 'page/views/data.dart';

class MyHomeScreen extends StatelessWidget{


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OurServicesContent services = OurServicesContent();
  bool loggedIn = true;

  MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: loggedIn ? drawer(context: context) : null,
          key: _scaffoldKey,
          appBar:loggedIn ? customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context):null,
          body:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // physics: BouncingScrollPhysics(),
            // shrinkWrap: true,
            children: [
               loggedIn ?  SizedBox(child: Image.asset('assets/image/kabah.png')):
          Stack(
          children: [
          SizedBox(child: Image.asset('assets/image/headback.png')),
    Padding(
    padding: const EdgeInsetsDirectional.only(top: 40),
    child: Center(
    child: Text("readAndLearn".tr,
    style: const TextStyle(
    color: kHomeColor,
    fontSize: 22,
    fontFamily: 'DinBold')),
    ),
    )
    ],
    ),
              customBoldText("welcome".tr),

              const BannerSlider(),

              TitleSubTitle(onTap: ()=>Get.to(()=> OurServicesScreen()),title:  "ourServices".tr, subtTitle: "allServices".tr,),

              SizedBox(
                // width: width*0.3,
                height: height*0.25,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount:services.ourServices.length ,
                    itemBuilder: (context , int index){
                      return InkWell(
                        onTap: (){
                           Get.toNamed(services.ourServices[index].routeName);
                        },
                        child: CardContent(
                            fontTitle: 18,
                            fontSubTitle: 14,
                            model:services.ourServices[index] ),
                      );

                    }),
              ),
              !loggedIn  ?
              const ToShowMoreAboutOurServices()
                  :const SizedBox(),

            ],
          ),
        ),
      ),
    );
  }
}
