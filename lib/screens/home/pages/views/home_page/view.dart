import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/auth/login/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/content.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/title_subTitle.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/to_show_more_about_our_services.dart';
import 'package:maktabat_alharam/screens/our_services/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';

import 'page/views/data.dart';

class MyHomeScreen extends StatelessWidget{


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OurServicesContent services = OurServicesContent();

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
          drawer: drawer(context: context),
          key: _scaffoldKey,
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
shrinkWrap: true,
          //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*0.4,),
              TitleSubTitle(onTap: ()=>Get.to(()=> OurServicesScreen()),title:  "ourServices".tr, subtTitle: "allServices".tr,),

              SizedBox(
               // width: width*0.3,
                height: height*0.2,
                child: InkWell(
                  onTap: () {
                  //  services.ourServices[index];
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                      itemCount:services.ourServices.length ,
                      itemBuilder: (context , int index){
                        return CardContent(
                            fontTitle: 14,
                            fontSubTitle: 10,
                            model:services.ourServices[index] );

                  }),
                ),
              ),
              const ToShowMoreAboutOurServices(),
              CustomButton(color: kSafeAreasColor,title:"signIn".tr ,onPressed: (){
                Get.to(()=>LoginScreen());
              },),

            ],
          ),
        ),
      ),
    );
  }
}
