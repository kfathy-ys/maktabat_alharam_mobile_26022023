import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/message_files/view.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/selector_opinion.dart';
import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';

// ignore: must_be_immutable
class AvailabilityMessageScreen extends StatefulWidget {
  const AvailabilityMessageScreen({Key? key}) : super(key: key);

  @override
  State<AvailabilityMessageScreen> createState() =>
      _AvailabilityMessageScreenState();
}

class _AvailabilityMessageScreenState extends State<AvailabilityMessageScreen> {
  final formKey = GlobalKey<FormState>();

  Opinion? _opinion;

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
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              context: context),
          body: SizedBox(
            height: height,
            width: width,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),

              physics: const BouncingScrollPhysics(),
              //  shrinkWrap: true,
              children: [
                Row(
                  children: [
                    HeadTopics(
                      title: "DepositScientificThesis".tr,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 8, start: 4, end: 4),
                      child: Text("availabilityMessageArrow".tr,
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              fontFamily: 'DinBold')),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                SelectorOpenion(
                  onChange: (value) {
                    setState(() {
                      _opinion = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmallestButton(
                      onPressed: () {
                        Get.back();
                        //  Get.to(()=> MyOrderAvailabilityMessageScreen());
                      },
                      title: "previous".tr,
                      color: kPrimaryColor,
                      image: "assets/image/twoarrowleft.png",
                    ),
                    _opinion == Opinion.no
                        ? const SizedBox()
                        : SmallestButton(
                            onPressed: () {
                              Get.to(() => const MessageFilesScreen());
                            },
                            title: "next".tr,
                            color: kPrimaryColor,
                            image: "assets/image/twoarrowright.png",
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
