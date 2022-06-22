import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class SubHint extends StatelessWidget {
  final String title;
  const SubHint({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
