import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

// ignore: must_be_immutable
class RequestEvents extends StatelessWidget {
  final String title;
  String? subTitle2;
  String? subTitle;
  Color? color1;
  Color? color2;

  RequestEvents(
      {Key? key,
      required this.title,
      this.subTitle2,
      this.subTitle,
      this.color1,
      this.color2})
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
              style: TextStyle(
                  color: color1, fontSize: 14, fontFamily: 'DinBold')),
          Text(subTitle2!,
              style: TextStyle(
                  color: color2, fontSize: 14, fontFamily: 'DinReguler')),
          Text(subTitle!,
              style: const TextStyle(
                  color: kAccentColor, fontSize: 14, fontFamily: 'DinReguler')),
        ],
      ),
    );
  }
}
