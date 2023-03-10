// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Color? color1;
  final Color? color2;

  const CardData(
      {Key? key, required this.title, this.subTitle, this.color1, this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: TextStyle(
                  color: color1, fontSize: 14, fontFamily: 'DinBold')),
          const SizedBox(
            width: 10,
          ),
          Text(subTitle!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: color2,
                  fontSize: 14,
                  fontFamily: 'DinReguler')),
        ],
      ),
    );
  }
}
