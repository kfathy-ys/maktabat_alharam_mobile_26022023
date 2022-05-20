import 'package:flutter/material.dart';

import '../../../../../widgets/constants.dart';
class CustomContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const CustomContainer({Key? key, required this.child, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 16.0),
      padding: const EdgeInsetsDirectional.only(bottom: 6.0),

      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kCardBorder)),
      child: child,
    );
  }
}
