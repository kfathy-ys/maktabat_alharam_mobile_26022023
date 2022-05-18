
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';
import 'package:maktabat_alharam/screens/widgets/CustomSearch.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';

import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import 'archive/view.dart';
import 'follow_reserved_retreated/view.dart';
import 'page/drop_down_order_name.dart';
import 'page/drop_down_state_name.dart';




// ignore: must_be_immutable
class MyOrdersScreen extends StatelessWidget{




  const MyOrdersScreen({Key? key}) : super(key: key);

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
                HeadTopics(title: "myOrders".tr,),

                const DropDownListOrderName(),
                const DropDownListStatesOrders(),
                 CustomSearch(

                  hint: "searchWithWord".tr,
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context ,int index){
                    return Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 16.0),

                      height: height*0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color:kCardBorder)
                      ),
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
                          CustomCardButton(color: kAccentColor,
                            title: "followRequest".tr,
                            onPressed: ()=>Get.to(()=>FollowReservedRetreatScreen()),
                            //  icon:  Icons.visibility_outlined
                            image: "assets/image/fulleyes.png",

                          ),
                          CustomCardButton(color: kAccentColor,
                            title: "updateRequest".tr,
                           // onPressed: ()=>Get.to(()=>FollowAnsweringLibrarian()),
                            //  icon:  Icons.visibility_outlined
                            image: "assets/image/update.png",

                          ),
                          CustomCardButton(color: kAccentColor,
                            title: "addToArchive".tr,

                              onPressed: ()=>Get.to(()=>const ArchiveMyOrdersScreen()),
                            image: "assets/image/archieve.png",
                            //  icon:Icons.cancel_outlined
                          ),

                        ],
                      ),

                    );
                  },

                ),
                Center(child: SmallButtonSizer(


                  onPressed: (){},
                  title: "addOne".tr,color: kPrimaryColor,image: "assets/image/newrequest.png",))




              ],
            ),
          ),
        ),
      ),
    );
  }

}
