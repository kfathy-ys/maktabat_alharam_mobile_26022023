import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/page/views/header.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

class AboutLibraryScreen extends StatelessWidget {
  const AboutLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: drawer(context: context),
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              context: context),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderTitle(
                    icon: Icons.library_books_outlined,
                    title: "aboutLibrary".tr),
                SizedBox(
                  height: height * 0.05,
                ),
                Image.asset('assets/image/kabah.png'),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: FadeInUp(
                    child:  Text(
                      "des".tr,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: kBlackText,
                          fontSize: 18,
                          fontFamily: "DinUltraLight"),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
