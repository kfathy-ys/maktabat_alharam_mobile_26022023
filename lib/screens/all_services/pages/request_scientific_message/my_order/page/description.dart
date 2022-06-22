import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class DescriptionMessage extends StatelessWidget {
  final String description;
  const DescriptionMessage({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      height: height * 0.24,
      decoration: BoxDecoration(
          color: kBackgroundCardColor, borderRadius: BorderRadius.circular(8)),
      child: Text(description,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: kBlackText, fontSize: 18, fontFamily: 'DinReguler')),
    );
  }
}
