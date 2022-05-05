import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class BannerSlider extends StatelessWidget {

  const BannerSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 15),
      //color: Colors.red,
      //color: Colors.yellowAccent,
      //height: height * 0.12,
    //  width: width*0.4,
      // height: height * 0.3,
      // width: width,
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (context, index, pageViewIndex) {
          return InkWell(
            onTap: () {
              //  interstitialAd.show();

              // navigateTo(context, BannerDetailsScreen(id: sliders[index].id,));
            },
            child: Container(
             // height: height * 0.12,
              width: width*0.42,
              decoration: BoxDecoration(  color: kSmallIconColor,borderRadius: BorderRadius.circular(6)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:   [
                  customSliderText(title: "عدد التحميلات ",color: kHomeColor),
                  customSliderText(title:"358,589 ",color: kAccentColor ),



                ],),
            )

            // const Sliders(
            //   title: "عدد التحميلات ",
            //   subTitle: "33355889 ",
            // ),
          );
        },
        options: CarouselOptions(
          height: height*0.14,

          //aspectRatio: 16 / 2,
          viewportFraction: 0.45,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: true,
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

}
