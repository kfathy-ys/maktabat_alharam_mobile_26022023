import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/page/views/cardContent.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/page/views/head_topices.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/follow_request_visit/cubit/follow_visit_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/view.dart';
import 'package:maktabat_alharam/screens/drawer/view.dart';

import 'package:maktabat_alharam/screens/widgets/appBar.dart';
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

    // var createdBy = Prefs.getString("createdBy");
     var userId = Prefs.getString("userId");
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return   Expanded(
      child: Container(
        margin:
        const EdgeInsetsDirectional.only(bottom: 10.0, top: 10.0),
      // height: height * 0.12,
        decoration: BoxDecoration(
          color: (userId  == userId)? kBackgroundCardColor: kIcon,
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
                      // maxLines: 1,
                      // overflow: TextOverflow.visible,
                      //
                      // softWrap: true,
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
      ),
    );
  }
}
