import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/content.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/list_model.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/sliders/banner_slider.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/title_subTitle.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/to_show_more_about_our_services.dart';
import 'package:maktabat_alharam/screens/our_services/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'page/views/data.dart';

// ignore: must_be_immutable
class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OurServicesContent services = OurServicesContent();
  OurServicesGridCard _ourServicesGridCard = OurServicesGridCard();


  final token = Prefs.getString('token');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: token.isNotEmpty ? drawer(context: context) : null,
          key: _scaffoldKey,
          appBar: token.isNotEmpty
              ? customAppbar(
                  icons: Icons.arrow_forward_outlined,
                  isIcons: true,
                  press: () => _scaffoldKey.currentState!.openDrawer(),
                  context: context)
              : null,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // physics: BouncingScrollPhysics(),
              // shrinkWrap: true,
              children: [
                token.isNotEmpty
                    ? SizedBox(child: Image.asset('assets/image/kabah.png'))
                    : Stack(
                        children: [
                          SizedBox(
                              child: Image.asset('assets/image/headback.png')),
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
                SizedBox(height: height*0.1,),
                customBoldText("welcome".tr),
                SizedBox(height: height*0.04,),
                const BannerSlider(),
                SizedBox(height: height*0.04,),

                TitleSubTitle(
                  onTap: () => Get.to(() => OurServicesScreen()),
                  title: "ourServices".tr,
                  subtTitle: "allServices".tr,
                ),
                SizedBox(height: height*0.04,),

                SizedBox(
                  // width: width*0.3,
                  height: height * 0.25,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: services.ourServices.length,
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(services.ourServices[index].routeName);
                          },
                          child: CardContent(
                              fontTitle: 20,
                              fontSubTitle: 14,
                              model: services.ourServices[index]),
                        );
                      }),
                ),
                !token.isNotEmpty
                    ? const ToShowMoreAboutOurServices()
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
