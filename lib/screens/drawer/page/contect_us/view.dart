import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/page/views/header.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:queen/queen.dart' show Launch;

// ignore: must_be_immutable
class ContactUsScreen extends StatelessWidget {
  String phone = "+1 5598 55488";
  String email = "lib@gph.gov.sa";
  String web = "http://stage-lib.cpt-it.com/ar/#";
  String location =
      "https://www.google.com/maps/@21.375498,39.833892,18z?hl=en";
  String twitter = "https://twitter.com/GPHLIBRARY";
  String youTube =
      "https://www.youtube.com/channel/UCfocGgF5-ngvNJQ45NqRoCQ/featured";
  ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderTitle(icon: Icons.phone, title: "contactsUs".tr),
              FadeInUp(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Image.asset("assets/image/bigKabah.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Launch.url(email);
                      },
                      child: const Text("lib@gph.gov.sa",
                          style: TextStyle(
                              color: kBlackText,
                              fontSize: 16,
                              fontFamily: 'DinLight')),
                    ),
                    Image.asset("assets/image/bigemail.png"),
                    InkWell(
                      onTap: () {
                        _launchPhoneURL(phone);
                      },
                      child: const Directionality(
                        textDirection:TextDirection.ltr ,
                        child: Text("+1 5598 55488",
                            style: TextStyle(
                                color: kBlackText,
                                fontSize: 16,
                                fontFamily: 'DinLight')),
                      ),
                    ),
                    Image.asset("assets/image/bigPhone.png"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Launch.url(web);
                      },
                      child: const Text("http://stage-lib.cpt-it.com",
                          style: TextStyle(
                              color: kBlackText,
                              fontSize: 16,
                              fontFamily: 'DinLight')),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Image.asset("assets/image/bigweb.png"),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Launch.url(location);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Saudi Arabia ",
                        style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                            fontFamily: 'DinLight')),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Image.asset("assets/image/location.png"),
                  ],
                ),
              ),
              FadeInUpBig(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("YouCanFollowUsSocialMedia".tr,
                      style: const TextStyle(
                          color: kSmallIconColor,
                          fontSize: 16,
                          fontFamily: 'DinReguler')),
                ),
              ),
              Image.asset("assets/image/divider.png"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Launch.url(youTube);
                      },
                      child: Image.asset("assets/image/youtube.png"),
                    ),

                    InkWell(
                      onTap: () {
                        Launch.url(twitter);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset("assets/image/Twitter.png"),
                      ),
                    ),
                    // Image.asset("assets/image/Linkedin.png")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    Launch.url(url);
  }
}
