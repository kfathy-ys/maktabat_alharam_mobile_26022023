import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/drawer/page/profile/page/views/header.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String phone = "+966255555444";
  String email = "Library@gmail.com";
  String web = "Library@gmail.com";
  String location = "Library@gmail.com";

  ContactUsScreen({Key? key}) : super(key: key);

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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderTitle(icon: Icons.phone, title: "contactsUs".tr),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Image.asset("assets/image/bigKabah.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap:(){
                        _launchPhoneURL(email);
                      },
                      child: const Text("Library@gmail.com",
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
                      child: const Text("+966255555444",
                          style: TextStyle(
                              color: kBlackText,
                              fontSize: 16,
                              fontFamily: 'DinLight')),
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
                      onTap:(){
                        launch(web);

                      },
                      child: const Text("www.Library.com",
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
                onTap:(){
                  _launchPhoneURL(location);
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("YouCanFollowUsSocialMedia".tr,
                    style: TextStyle(
                        color: kSmallIconColor,
                        fontSize: 16,
                        fontFamily: 'DinReguler')),
              ),
              Image.asset("assets/image/divider.png"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/image/Facebook.png"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset("assets/image/Twitter.png"),
                    ),
                    Image.asset("assets/image/Linkedin.png")
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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
