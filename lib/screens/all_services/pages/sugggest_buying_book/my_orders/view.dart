
import 'package:flutter/material.dart';
import '../../ask_Librarian/my_order/page/views/cardContent.dart';
import '../../ask_Librarian/page/views/head_topices.dart';
import '../archive/view.dart';
import 'page/views/description.dart';
import '../update/view.dart';
import '../../../../drawer/view.dart';
import '../../../../widgets/CustomCardButton.dart';
import '../../../../widgets/appBar.dart';
import '../../../../widgets/constants.dart';
import 'package:get/get.dart';
import '../../../../widgets/smallButtonSizer.dart';
import '../view.dart';

class MyOrdersSuggestBuyBookScreen extends StatelessWidget {

  const MyOrdersSuggestBuyBookScreen({Key? key}) : super(key: key);

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
                  title: "SuggestionBuyBook".tr,
                ),
                DescriptionBook(description: "headBuyBook".tr),
                Center(
                    child: SmallButtonSizer(
                  onPressed: () {
                    Get.to(() => const SuggestToBuyBook());
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
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                      height: height * 0.42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kCardBorder)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardData(
                              title: "nameResponsible".tr,
                              subTitle: "أحمد عبد السلام",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          CardData(
                              title: "titleOfBook".tr,
                              subTitle: "ASD",
                              color1: kSmallIconColor,
                              color2: kSkyButton),
                          CardData(
                              title: "requestDate".tr,
                              subTitle: "Mar 23,2022",
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
                            title: "updateRequest".tr,
                            onPressed: () =>
                                Get.to(() => const UpdateSuggestToBuyBook()),
                            image: "assets/image/update.png",
                          ),
                          CustomCardButton(
                            color: kAccentColor,
                            title: "addToArchive".tr,
                            onPressed: () =>
                                Get.to(() => const ArchiveSuggestBuyBookScreen()),
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
