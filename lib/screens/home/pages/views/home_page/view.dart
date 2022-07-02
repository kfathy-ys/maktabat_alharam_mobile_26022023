import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/cubit/top_three_cubit.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/content.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/sliders/banner_slider.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/title_subTitle.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/to_show_more_about_our_services.dart';
import 'package:maktabat_alharam/screens/our_services/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../widgets/loading.dart';
import 'page/views/data.dart';

// ignore: must_be_immutable
class MyHomeScreen extends StatelessWidget {
  final String? userId;
  MyHomeScreen({Key? key, this.userId}) : super(key: key);

  OurServicesContent services = OurServicesContent();

  final token = Prefs.getString('token');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kHomeColor,
      child: SizedBox(
        height: height,
        child: ListView(
          // padding: const EdgeInsets.symmetric(vertical: 20),
          physics: const PageScrollPhysics(),
          children: [
            token.isNotEmpty
                ? SizedBox(
                    height: height * 0.2,
                    child: Image.asset(
                      'assets/image/kabah.png',
                    ))
                : Stack(
                    children: [
                      Image.asset(
                        'assets/image/headback.png',
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
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
            buildSizedBox(height),
            Center(child: customBoldText(title: "welcome".tr)),
            buildSizedBox(height),
             BlocProvider(
  create: (context) => TopThreeCubit(),
  child: BlocConsumer<TopThreeCubit, TopThreeState>(
  listener: (context, state) {},
  builder: (context, state) {


    if (state is TopThreeLoading) {
      return SizedBox(

        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,

          enabled: true,
          child: SizedBox()
        ),
      );
    }
    if (state is TopThreeSuccess) {
        return SizedBox(

              child: CarouselSlider.builder(
                itemCount: state.topThreeModels.data!.length,
                itemBuilder: (context, index, pageViewIndex) {
                  return Container(

                    width: width * 0.42,
                    decoration: BoxDecoration(
                        color: kSmallIconColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customSliderText(
                            title: state.topThreeModels.data![index].requestName.toString(), color: kHomeColor),
                        customSliderText(title:state.topThreeModels.data![index].requestsCount.toString(), color: kAccentColor),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  height: height * 0.14,

                  //aspectRatio: 16 / 2,
                  viewportFraction: 0.45,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            );
    }
    if (state is TopThreeError) {
      return Text(state.msg);
    }

    return const SizedBox();


  },
),
),
            token.isNotEmpty ? buildSizedBox(height) : const SizedBox(),

            TitleSubTitle(
              onTap: () {
                // navigateTo(context, OurServicesScreen());
                Get.to(() => OurServicesScreen());
              },
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
                        final page = services.ourServices[index].pages;

                        if (((page == Pages.one) ||
                                (page == Pages.two) ||
                                (page == Pages.five)) &&
                            Prefs.getString("token").isEmpty) {
                          onWillPopSignIn(context);
                          return;
                        }
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

            ///  buildSizedBox(height),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.04,
      );
}
