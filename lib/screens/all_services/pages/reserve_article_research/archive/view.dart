
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/archive/page/views/title.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/view.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';






// ignore: must_be_immutable
class ArchiveReserveArticleScreen extends StatelessWidget{




  const ArchiveReserveArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer:  drawer(context: context) ,
          appBar:customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              context: context),
          body:  Container(
            margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            height: height,

            width: width,
            child: ListView(

              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children:  [
                const HeadTitle(),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context ,int index){
                    return Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 16.0),
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),

                      height: height*0.33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color:kCardBorder)
                      ),
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

                          CustomCardButton(color: kAccentColor,
                            title: "removeFromArchive".tr,
                            onPressed: (){
                            Get.to(()=>const MyOrdersScientificMessage());
                            },
                            //  icon:  Icons.visibility_outlined
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
