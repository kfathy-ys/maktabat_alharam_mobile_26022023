import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';

import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/mdeiaButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallButtonSizer.dart';
import 'package:maktabat_alharam/screens/widgets/smallestButton.dart';
import 'package:queen/core/helpers/prefs.dart';

import 'package:queen/validation/magic/is_optional.dart';
import 'package:queen/validation/text/is_not_empty.dart';
import 'package:queen/validation/text/max_length.dart';
import 'package:queen/validation/validator.dart';

import 'bacis_info/view.dart';





// ignore: must_be_immutable
class PutScientificMessage extends StatefulWidget {
  const PutScientificMessage({Key? key}) : super(key: key);

  @override
  State<PutScientificMessage> createState() =>
      _PutScientificMessageState();
}

class _PutScientificMessageState
    extends State<PutScientificMessage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();

  bool value = false;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    Prefs.setString("mark", "mark");
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
          body: Container(
            //  margin:ri const EdgeInsets.symmetric(hozontal: 0,vertical: 10),
            height: height,

            width: width,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 22),

              physics: const BouncingScrollPhysics(),
              //  shrinkWrap: true,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12),
                  child: HeadTopics(
                    title: "DepositScientificThesis".tr,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18,),
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical:6),
                  height: height*0.12,
                  decoration: BoxDecoration(
                      color: kBackgroundCardColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(
                      "termsHead".tr,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: kBlackText, fontSize: 18, fontFamily: 'DinReguler'
                      )
                  ),
                ),

                buildListTile(color: kBlackText, title: "fillOut".tr ,image:"assets/image/dot.png" ),
                buildListTile(color: kBlackText,title: "delivered".tr ,image:"assets/image/dot.png" ),
                buildListTile(color: kBlackText,title: "copy".tr ,image:"assets/image/dot.png" ),
                buildListTile(color: kBlackText,title: "numbersTwo".tr ,image:"assets/image/dot.png" ),
                buildListTile(color: kSmallIconColor,title: "putting".tr ,image:"assets/image/dot.png" ),
                buildListTile(color: kBlackText,title: "fillOut".tr ,image:"assets/image/dot.png" ),

                 ListTile(
                 //  horizontalTitleGap: 1,
                   title: Text("areYouOk".tr, style:  const TextStyle(
                       color: kBlackText, fontSize: 14, fontFamily: 'DinReguler'
                   )),
                   leading:  Checkbox(

                     activeColor: kAccentColor,
                     value: value,
                     onChanged: ( value) {
                       setState(() {
                         this.value = value!;
                       });
                     },
                   ),
                 ),



                Row(
                  children: [
                    SizedBox(width: width*0.5,),
                    SmallestButton(

                      onPressed: ()async {
                        if(value == false){
                          log("false");
                          await  CustomDialog(context: context , title: "terms".tr,
                              accept: "yes".tr   ,refuse: "no".tr , subtitle: "youMust".tr);
                        }else{

                          await Get.to(()=> const BasicInfoScreen());
                          Prefs.getString("mark");
                    log("true");

                        }
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

  ListTile buildListTile({required Color color ,  required String title , required String image}) {
    return ListTile(
                horizontalTitleGap: 1,
                //"fillOut".tr
                title: Text(title, style:  TextStyle(
                    color: color, fontSize: 14, fontFamily: 'DinReguler'
                )),
                  //"assets/image/dot.png"
                  leading:Image.asset(image),

                );
  }

  Padding buildPadding({required String title}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 40),
      child: Text(
        title,
        style: const TextStyle(
          color: kBlackText,
          fontSize: 16,
          fontFamily: "DinReguler",
        ),
      ),
    );
  }

  Row buildRow({
    required String title,
    String? subTitle,
    Color? color1,
    Color? color2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(title,
            //  "محتوي الطلب",
//kSmallIconColor
            style:
            TextStyle(color: color1, fontSize: 14, fontFamily: 'DinBold')),
        Text(subTitle!,
            // "هل المكتبة متاحة يوم الجمعة؟",
//kBlackText
            style: TextStyle(
                color: color2, fontSize: 14, fontFamily: 'DinReguler')),
      ],
    );
  }



  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
