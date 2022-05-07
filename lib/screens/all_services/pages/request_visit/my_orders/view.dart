
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/archive/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/follow_request_visit/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/my_orders/page/headTile.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/update_order/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import '../view.dart';


class MyOrderRequestVisitScreen extends StatelessWidget {

  const MyOrderRequestVisitScreen({Key? key}) : super(key: key);

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
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            height: height,
            width: width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                HeadTopics(
                  title: "RequestVisit".tr,
                ),
                DescriptionVisit(
                  description: "titleHead".tr,
                ),
                Center(
                    child: SmallButtonSizer(
                  onPressed: () {
                    Get.to(() => const RequestVisitScreen());
                  },
                  title: "addOne".tr,
                  color: kPrimaryColor,
                  image: "assets/image/newrequest.png",
                )),
                SizedBox(
                  height: height * 0.03,
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 16.0),
                      height: height * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kCardBorder)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardData(
                              title: "nameRequest".tr,
                              subTitle: "هل المكتبة متاحة يوم الجمعة؟",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          CardData(
                              title: "nameResponsible".tr,
                              subTitle: "أحمد عبد السلام",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          CardData(
                              title: "requestDate".tr,
                              subTitle: "Mar 31 , 2022",
                              color1: kSmallIconColor,
                              color2: kSkyButton),
                          CardData(
                              title: "requestState".tr,
                              subTitle: "نعم",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          CardData(
                            title: "orderProcedure".tr,
                            subTitle: "",
                            color1: kBlackText,
                            //  color2: kBlackText
                          ),
                          CustomCardButton(
                            color: kAccentColor,
                            title: "followRequest".tr,
                            onPressed: () =>
                                Get.to(() => FollowRequestVisitScreen()),
                            image: "assets/image/fulleyes.png",
                          ),
                          CustomCardButton(
                            color: kAccentColor,
                            title: "updateRequest".tr,
                            onPressed: () =>
                                Get.to(() => const UpdateOrderOfVisitRequest()),
                            image: "assets/image/update.png",
                          ),
                          CustomCardButton(
                            color: kAccentColor,
                            title: "addToArchive".tr,
                            onPressed: () =>
                                Get.to(() => const ArchiveRequestToVisitScreen()),
                            image: "assets/image/archieve.png",
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
