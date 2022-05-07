import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/content.dart';
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

  OurServicesContent services = OurServicesContent();

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

          appBar: token.isNotEmpty
              ? customAppbar(
                  icons: Icons.arrow_forward_outlined,
                  isIcons: true,
                  context: context)
              : null,
          body: SizedBox(
            height: height,

            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                token.isNotEmpty
                    ? SizedBox(child: Image.asset('assets/image/kabah.png',))
                    : Stack(
                        children: [
                    Image.asset('assets/image/headback.png',
                      width: double.infinity,
                      fit: BoxFit.fill,),
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
                token.isEmpty ? buildSizedBox(height):SizedBox(),
                Center(child: customBoldText("welcome".tr)),
                token.isEmpty ?  buildSizedBox(height):SizedBox(),
                const BannerSlider(),
               // buildSizedBox(height),

                TitleSubTitle(
                  onTap: () => Get.to(() => OurServicesScreen()),
                  title: "ourServices".tr,
                  subtTitle: "allServices".tr,
                ),
              //  buildSizedBox(height),

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
               // buildSizedBox(height),
                !token.isNotEmpty
                    ? const ToShowMoreAboutOurServices()
                    : const SizedBox(),
                buildSizedBox(height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(height: height*0.04,);



}

