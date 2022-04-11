import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/view.dart';
import 'package:maktabat_alharam/screens/home/view.dart';
import 'package:maktabat_alharam/screens/widgets/network_dialog.dart';
import 'package:queen/core/helpers/prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
goToHomePage(context);
super.initState();
  }
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
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () => Get.offAll(() => const HomeTabScreen()),
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

  void goToHomePage(BuildContext context) async {
  //  await GlobalNotification().setUpFirebase();

    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        Timer(
            const Duration(
              // seconds: 1,
              seconds: 3,
            ), () {
         // _bloc.add(AppStarted());
        });
      }
    } on SocketException catch (_) {
      showNetworkErrorDialog(context, () {
        Navigator.of(context).pop();
       Get.to(()=>MyHomeScreen()) ;
      });
    }
  }
}


