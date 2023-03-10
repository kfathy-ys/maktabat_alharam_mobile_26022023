import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class DateCreated extends StatelessWidget {
  final String typeDate;

  const DateCreated({Key? key, required this.typeDate, required this.date})
      : super(key: key);

  final String date;
  @override
  Widget build(BuildContext context) {
    //  double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(typeDate,
            style: const TextStyle(
                color: kBlackText, fontSize: 14, fontFamily: 'DinLight')),
        SizedBox(
          width: width * 0.05,
        ),
        Text(date,
            style: const TextStyle(
                color: kTextFieldColor, fontSize: 14, fontFamily: 'DinLight')),
      ],
    );
  }
}
