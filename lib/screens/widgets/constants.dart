// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/bacis_info/view.dart';
import 'package:maktabat_alharam/screens/auth/login/view.dart';
import 'package:queen/core/helpers/prefs.dart';

import 'alerts.dart';

const kPrimaryColor = Color(0xFF258270);

const kSuccessAlertColor = Color(0xFF000080);
const Color kTextColor = Color(0xFF21927E);
const Color kSafeAreaColor = Color(0xFF186C5C);
const Color kAccentColor = Color(0xFFCBB176);
const Color kAppBarColor = Color(0xFF02774D);

const Color kTextTables = Color(0xFFF7F7F7);
const Color kTextFieldColor = Color(0xFF8D8D8D);
const Color kOffColor = Color(0xFFBDE4D6);
const Color kSafeAreasColor = Color(0xFF004926);
const Color kSmallIconColor = Color(0xFF009660);
const kBackgroundCardColor = Color(0xFFEFEFEF);
const kSkyLightColor = Color(0xFFDDEFFF);

const kBackgroundButton = Color(0xFFE6E6E6);
const kSkyButton = Color(0xFF609FFF);

const kRose = Color(0xFFFFC5B9);
const kIcon = Color(0xFF74572F);
const kButtonGreenDark = Color(0xFF008000);
const kButtonRedDark = Color(0xFFC50B0B);
const Color kHomeColor = Color(0xFFFFFFFF);
const Color kRoundColor = Color(0xFFFEBD2F);
const Color kLightText = Color(0xFF484848);
const Color kBlackText = Color(0xFF262626);
const Color kCardBorder = Color(0xFF2C3E50);
const Color kDrawerBackText = Color(0xFF292929);
const Color kRoundBorderColor = Color.fromRGBO(220, 220, 220, 1);

/*const kGreenColor = Color(0xFF03AB6A);
const kLightGreenColor = Color(0xFF099861);
const kGreyTextColor = Color(0xFF898A8D);
const kWhitecardColor = Color(0xFFF5F5F5);
const kprimaryLightColor = Color(0x5c0090CF);
const kFavouriteColor = Color(0xFFAB0D03);
const kPrimaryFDarkColor = Color(0xFF0A4E75);
const kPrimaryBlueColor = Color(0xFF3080D1);
const khTextColor = Color(0xFF323232);*/
String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

Widget customDivider(double height) => Container(
      width: double.infinity,
      height: height,
      color: Colors.grey[300],
    );

Widget customDivider2(double height) => Container(
      width: double.infinity,
      height: height,
      color: Colors.white,
    );

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  fontFamily: 'Contrail',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

Widget customNormalText({required BuildContext context, String? title}) {
  return Text(
    title!,
    style: Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(color: Colors.black, fontSize: 16, fontFamily: 'Contrail'),
  );
}

Widget customMeduimBoldText(String? title) {
  return Text(title!,
      style: const TextStyle(
          color: kRoundBorderColor, fontSize: 18, fontFamily: 'NeoSansBold'));
}

Widget customBoldText({required String title}) {
  return Text(title,
      style: const TextStyle(
          color: kBlackText, fontSize: 18, fontFamily: 'DinBold'));
}

void showAlertDialog(BuildContext context, VoidCallback onTap) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("??????????????"),
            content: const Text("???????? ?????????? ?????????? ?????? ??????????????"),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    onTap();
                    Get.back();
                  },
                  child: Text("yes".tr)),
              CupertinoDialogAction(
                  textStyle: const TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);
                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    //prefs.remove('isLogin');
                    Navigator.pop(context);
                  },
                  child: Text("no".tr)),
            ],
          ));
}
void showAlertDialogOpenCamera(BuildContext context, VoidCallback onTap) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("????????????????"),
            content: const Text("???? ???????? ???????????? ?????? ???????????????? "),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    onTap();
                    Get.back();
                  },
                  child: Text("yes".tr)),
              CupertinoDialogAction(
                  textStyle: const TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    Alert.error(
                               "?????? ???????????? ?????? ?????????? ???????????? ?????? ????????????????");

                        Navigator.pop(context);


                  },
                  child: Text("no".tr)),
            ],
          ));
}

Widget customSliderText({required String title, required Color color}) {
  return Text(title,
      style: TextStyle(color: color, fontSize: 18, fontFamily: 'DinBold'));
}

Widget customLightText(String? title) {
  return Text(title!,
      style: const TextStyle(
          color: kBlackText, fontSize: 18, fontFamily: 'DinLight'));
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

const subheadingStyle = TextStyle(
  fontFamily: 'Contrail',
  fontWeight: FontWeight.w400,
  color: Colors.grey,
);

spaceH(double height) {
  return SizedBox(height: height);
}

spaceW(double width) {
  return SizedBox(width: width);
}

void archiveClients(
  BuildContext context, {
  required double height,
  required double width,
  required VoidCallback onTapCustomerCase,
  required VoidCallback onTapCustomerSource,
  required VoidCallback onTapCustomerClass,
  required VoidCallback onTapMonthlyRating,
  required VoidCallback onTapProjectRating,
}) {
  showModalBottomSheet(
    backgroundColor: kHomeColor,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    ),
    context: context,
    builder: (_) {
      return SizedBox(
        height: height * 0.35,
        width: width,
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              // ignore: prefer_const_constructors
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '?????????? ?????????????? ',
                          style: TextStyle(
                              fontFamily: 'Contrail',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    classificationContainer(height, width,
                        onTap: onTapCustomerCase,
                        classificationName: '?????????? ?????????? ????????????'),
                    classificationContainer(height, width,
                        onTap: onTapCustomerSource,
                        classificationName: '?????????? ?????????? ????????????'),
                    classificationContainer(height, width,
                        onTap: onTapCustomerClass,
                        classificationName: '?????????? ???????? ????????????'),
                    classificationContainer(height, width,
                        onTap: onTapMonthlyRating,
                        classificationName: '?????????? ????????'),
                    classificationContainer(height, width,
                        onTap: onTapProjectRating,
                        classificationName: '?????????? ????????????????'),
                  ],
                ),
              );
            }),
      );
    },
  );
}

void archiveClientsActions(
  BuildContext context, {
  required double height,
  required double width,
  required VoidCallback onTapToArchive,
  required VoidCallback onTapConnectedDone,
  required VoidCallback onTapNotRespond,
}) {
  showModalBottomSheet(
    backgroundColor: kHomeColor,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    ),
    context: context,
    builder: (_) {
      return SizedBox(
        height: height * 0.2,
        width: width,
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              // ignore: prefer_const_constructors
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    classificationContainer(height, width,
                        onTap: onTapToArchive,
                        classificationName: '?????? ??????????????'),
                    classificationContainer(height, width,
                        onTap: onTapConnectedDone,
                        classificationName: '???? ??????????????'),
                    classificationContainer(height, width,
                        onTap: onTapNotRespond, classificationName: '???? ??????'),
                  ],
                ),
              );
            }),
      );
    },
  );
}

InkWell classificationContainer(double height, double width,
    {required String classificationName, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: height * 0.049,
      width: width,
      color: Colors.white,
      child: Text(
        classificationName,
        style: const TextStyle(
            fontFamily: 'Contrail',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: kBlackText),
      ),
    ),
  );
}

Future<void> showConfirmationDialog(BuildContext context,
    {required String image,
    required String title,
    required Widget done,
    required Widget cancelled}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Image.asset(
        image,
        width: width * 2,
        height: height * 0.15,
        fit: BoxFit.contain,
      ),
      content: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: 'Contrail',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: kBlackText),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      done,
                      cancelled,
                    ],
                  ),
                ),
              ],
            ),
          )),
    ),
  );
}

Future<bool> onWillPop(BuildContext context) async {
  final shouldPop = await showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text(
        ' ?????????? ????????????????',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      content: const Text(
        '???? ?????? ?????????? ??????  ???????? ?????????? ?????????????? ??',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 12,
            // fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "??????????",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        CupertinoDialogAction(
            textStyle: const TextStyle(color: Colors.red),
            isDefaultAction: true,
            onPressed: () => exit(0),
            child: const Text(
              "?????????? ????????",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    ),
  );

  return shouldPop ?? false;
}

Future<bool> onWillPopSignIn(BuildContext context) async {
  final shouldPop = await showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text(
        ' ?????????? ??????????????',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      content: const Text(
        '???? ?????? ?????????? ??????  ????????  ?????????? ???????????? ??',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 12,
            // fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "??????????",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        CupertinoDialogAction(
            textStyle: const TextStyle(color: Colors.red),
            isDefaultAction: true,
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
            child: const Text(
              "?????????? ????????????",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    ),
  );

  return shouldPop ?? false;
}

Future<bool> CustomDialog(
    {required BuildContext context,
    String? title,
    String? subtitle,
    String? accept,
    String? refuse}) async {
  final shouldPop = await showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(title!,
                style: const TextStyle(
                    color: kBlackText, fontSize: 18, fontFamily: 'DinBold')),
            content: Text(subtitle!,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            actions: [
              CupertinoDialogAction(
                  child: Text(refuse!,
                      style: const TextStyle(
                          color: kButtonRedDark,
                          fontSize: 14,
                          fontFamily: 'DinReguler')),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CupertinoDialogAction(
                  child: Text(accept!),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Prefs.getString("mark");
                    Get.to(() => const BasicInfoScreen());
                  }),
            ],
          ));
  return shouldPop ?? false;
}

//constant functions
double sizeFromHeight(BuildContext context, double fraction,
    {bool removeAppBarSize = true}) {
  double deviceHeight = MediaQuery.of(context).size.height;
  fraction = (removeAppBarSize
          ? (deviceHeight - AppBar().preferredSize.height)
          : deviceHeight) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(BuildContext context, double fraction) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}

class SizeConfig {
  static double screenHeight = 0.0;
  static double screenWidth = 0.0;

  void init(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
