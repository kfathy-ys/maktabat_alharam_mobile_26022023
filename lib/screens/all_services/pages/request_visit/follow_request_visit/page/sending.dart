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



class Message extends StatelessWidget {
  final String name;
  final String comment ;
  final String data;
  const Message({Key? key, required this.name, required this.comment, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return   Container(
      margin:
      const EdgeInsetsDirectional.only(bottom: 10.0, top: 10.0),
     height: height * 0.1,
      decoration: BoxDecoration(
        color: kBackgroundCardColor,
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
          CardData(
              title: comment,
              subTitle:data,
              color1: kSmallIconColor,
              color2: kAccentColor),
        ],
      ),
    );
  }
}
