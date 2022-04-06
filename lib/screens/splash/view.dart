import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/home/view.dart';
import 'package:queen/core/helpers/prefs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      bool isBoarding = Prefs.getBool('onBoarding');
      // if (isBoarding) {
      //   Get.offAll(() =>  NavigationBar());
      // } else {
      //   Timer(const Duration(seconds: 2),
      //       () => Get.offAll(() => const OnBoardingScreen()));
      // }
    });

    return SafeArea(
        child: Stack(
         fit: StackFit.expand,
          children: [
          Image.asset(
          "assets/image/splash screen.png",
          fit: BoxFit.fill,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child:  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: InkWell(
                onTap: ()=>   Get.offAll(() => const HomeTabScreen()),
                child: Image.asset(
                        'assets/image/Group 30.png',

                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
