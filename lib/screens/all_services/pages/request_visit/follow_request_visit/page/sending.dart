import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';

import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:queen/core/helpers/prefs.dart';



// ignore: must_be_immutable
class Message extends StatelessWidget {
  final String name;
  final String comment ;
  final String data;

   const Message({Key? key,required this.name, required this.comment, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     var createdBy = Prefs.getString("createdBy");
     var userId = Prefs.getString("userId");
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return   Container(
      width: width,
      padding: const EdgeInsetsDirectional.only(bottom: 4,top: 4),
      margin:
      const EdgeInsetsDirectional.only(bottom: 10.0, top: 10.0),

      decoration: BoxDecoration(
        color: (userId  != createdBy)? kBackgroundCardColor: kIcon,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          CardData(
              title: name,
              subTitle: "",
              color1: kAccentColor,
              color2: kAccentColor),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16,),            child: Wrap(

              children: [
                Text(comment,
softWrap: true,
                    maxLines: 7,
                    style: const TextStyle(
                        color: kSmallIconColor, fontSize: 14, fontFamily: 'DinBold')),

                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(data,
                      style: const TextStyle(
                          color: kAccentColor, fontSize: 14, fontFamily: 'DinReguler')),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
