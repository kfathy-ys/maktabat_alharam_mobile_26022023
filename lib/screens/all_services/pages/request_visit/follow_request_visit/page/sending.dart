import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:queen/core/helpers/prefs.dart';

// ignore: must_be_immutable
class Message extends StatelessWidget {
  final String name;
  final String comment;

  final String data;
  final bool isMe;

  const Message(
      {Key? key,
      required this.name,
      required this.comment,
      required this.data,
      required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var createdBy = Prefs.getString("createdBy");
    var userId = Prefs.getString("userId");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding:
          const EdgeInsetsDirectional.only(bottom: 4, top: 4, start: 10, end: 10),
      margin: const EdgeInsetsDirectional.only(bottom: 10.0, top: 10.0),
      width: width,
     // height: height*0.12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:  kBackgroundCardColor ),

      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(name,
              maxLines: 1,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: const TextStyle(
                  color: kAccentColor, fontSize: 14, fontFamily: 'DinBold')),
          Text(comment,
              maxLines: 7,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.start,
              softWrap: true,
              style: const TextStyle(
                  color: kSafeAreasColor, fontSize: 14, fontFamily: 'DinBold')),
         isMe ?  Align(
           alignment: AlignmentDirectional.bottomEnd,
           child: Text(data,
               maxLines: 1,
               overflow: TextOverflow.visible,
               softWrap: true,
               style: const TextStyle(
                   color: kAccentColor, fontSize: 14, fontFamily: 'DinBold')),
         ) :  Align(
           alignment: AlignmentDirectional.bottomStart,
           child: Text(data,
               maxLines: 1,
               overflow: TextOverflow.visible,
               softWrap: true,
               style: const TextStyle(
                   color: kAccentColor, fontSize: 14, fontFamily: 'DinBold')),
         ),
        ],
      ),
    );
  }
}

/*
* Container(
      width: width,
      padding: const EdgeInsetsDirectional.only(bottom: 4, top: 4),
      margin: const EdgeInsetsDirectional.only(bottom: 10.0, top: 10.0),
      decoration: BoxDecoration(
        color: (userId == createdBy) ? kBackgroundCardColor : kHomeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (userId == createdBy) ? Directionality(
            textDirection: TextDirection.rtl,
            child: CardData(
                title: name,
                subTitle: "",
                color1: kAccentColor,
                color2: kAccentColor),
          ):Directionality(
            textDirection: TextDirection.ltr,
            child: CardData(
                title: name,
                subTitle: "",
                color1: kAccentColor,
                color2: kAccentColor),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
            ),
            child: Wrap(
              children: [
                Text(comment,
                    softWrap: true,
                    maxLines: 7,
                    style: const TextStyle(
                        color: kSmallIconColor,
                        fontSize: 14,
                        fontFamily: 'DinBold')),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(data,
                      style: const TextStyle(
                          color: kAccentColor,
                          fontSize: 14,
                          fontFamily: 'DinReguler')),
                ),
              ],
            ),
          ),
        ],
      ),
    );*/
