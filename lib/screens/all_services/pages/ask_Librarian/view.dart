import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';
import 'package:maktabat_alharam/screens/widgets/CustomCardButton.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/mediaButton.dart';
import 'package:maktabat_alharam/screens/widgets/smallButton.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';

import 'follow_answering_librarian/view.dart';


// ignore: must_be_immutable
class AskLibrarian extends StatelessWidget{


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loggedIn = true;

  AskLibrarian({Key? key}) : super(key: key);

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
          key: _scaffoldKey,
          appBar:customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              press: () => _scaffoldKey.currentState!.openDrawer(),
              context: context),
          body:  Container(
            margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            height: height,

            width: width,
            child: ListView(

            // padding: EdgeInsets.symmetric(vertical: 10),
             // crossAxisAlignment: CrossAxisAlignment.start,
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               physics: const BouncingScrollPhysics(),
               shrinkWrap: true,
              children:  [
               HeadTopics(title: "askLibrarian".tr,),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical:6),
                  height: height*0.24,
                   decoration: BoxDecoration(
                     color: kBackgroundCardColor,
                     borderRadius: BorderRadius.circular(8)
                   ),
                  child: Text(
                      "head".tr,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: kBlackText, fontSize: 18, fontFamily: 'DinReguler'
                      )
                  ),
                ),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context ,int index){
                    return Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 16.0),

                      height: height*0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color:kCardBorder)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRow(
                              title: "محتوي الطلب",
                              subTitle: "هل المكتبة متاحة يوم الجمعة؟",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          buildRow(
                              title: "تاريخ الطلب",
                              subTitle: " Mar 31 , 2022                     \t\t",
                              color1: kSmallIconColor,
                              color2: kSkyButton),
                          buildRow(
                              title: "رد  الموظف",
                              subTitle: "    نعم                                         ",
                              color1: kSmallIconColor,
                              color2: kBlackText),
                          buildRow(
                            title: "إجراءات الطلب",
                            subTitle: "                                             ",
                            color1: kBlackText,
                            //  color2: kBlackText
                          ),
                          CustomCardButton(color: kAccentColor,
                            title: "متابعه الطلب",
                            onPressed: ()=>Get.to(()=>FollowAnsweringLibrarian()),
                            //  icon:  Icons.visibility_outlined
                            image: "assets/image/fulleyes.png",

                          ),

                          CustomCardButton(color: kAccentColor,
                              title: "إالغاء الطلب",
                              onPressed: (){},
                            image: "assets/image/fullerror.png",
                            //  icon:Icons.cancel_outlined
                          ),

                        ],
                      ),

                    );
                  },

                ),
                Center(child: SmallButtonSizer(onPressed: (){
                  return null;
                }, title: "طلب جديد",color: kPrimaryColor,image: "assets/image/VectorAcc.png",))




                //customSliderText(title: "askLibrarian".tr, color: kBlackText)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRow({required String title ,  String? subTitle , Color? color1 , Color? color2 ,}) {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         Text(
                          title,
                          //  "محتوي الطلب",
//kSmallIconColor
                            style:  TextStyle(
                                color: color1, fontSize: 14, fontFamily: 'DinBold'
                            )
                        ),
                         Text(

                           subTitle!,
                           // "هل المكتبة متاحة يوم الجمعة؟",
//kBlackText
                            style:  TextStyle(
                                color: color2, fontSize: 14, fontFamily: 'DinReguler'
                            )
                        ),
                      ],
                    );
  }
}
