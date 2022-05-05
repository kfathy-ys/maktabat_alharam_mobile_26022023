// import 'package:flutter/material.dart';
//
// import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/content.dart';
// import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/data.dart';
// import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/sliders/banner_slider.dart';
// import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/title_subTitle.dart';
// import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/to_show_more_about_our_services.dart';
// import 'package:maktabat_alharam/screens/our_services/view.dart';
// import 'package:maktabat_alharam/screens/widgets/constants.dart';
// import 'package:get/get.dart';
//
//
// // ignore: must_be_immutable
// class HomeNotAuthScreen extends StatelessWidget {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   OurServicesContent services = OurServicesContent();
//   bool loggedIn = false;
//
//   HomeNotAuthScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Container(
//       color: kAppBarColor,
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: kHomeColor,
//
//           key: _scaffoldKey,
//
//           body: ListView(
//            // crossAxisAlignment: CrossAxisAlignment.center,
//             //mainAxisAlignment: MainAxisAlignment.spaceAround,
//              physics: BouncingScrollPhysics(),
//              shrinkWrap: true,
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(child: Image.asset('assets/image/headback.png')),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(top: 40),
//                     child: Center(
//                       child: Text("readAndLearn".tr,
//                           style: const TextStyle(
//                               color: kHomeColor,
//                               fontSize: 22,
//                               fontFamily: 'DinBold')),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: height*0.05,),
//               const BannerSlider(),
//               SizedBox(height: height*0.05,),
//               TitleSubTitle(
//                 onTap: () => Get.to(() => OurServicesScreen()),
//                 title: "ourServices".tr,
//                 subtTitle: "allServices".tr,
//               ),
//               SizedBox(
//                 // width: width*0.3,
//                 height: height * 0.25,
//                 child: InkWell(
//                   onTap: () {
//                     //  services.ourServices[index];
//                   },
//                   child: ListView.builder(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       physics: const BouncingScrollPhysics(),
//                       itemCount: services.ourServices.length,
//                       itemBuilder: (context, int index) {
//                         return CardContent(
//                             fontTitle: 18,
//                             fontSubTitle: 14,
//                             model: services.ourServices[index]);
//                       }),
//                 ),
//               ),
//               SizedBox(height: height*0.05,),
//               const ToShowMoreAboutOurServices()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
