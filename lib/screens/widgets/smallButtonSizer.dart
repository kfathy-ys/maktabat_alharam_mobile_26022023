// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class SmallButtonSizer extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color color;
  // ignore: prefer_typing_uninitialized_variables
  final isLoading;
  // ignore: prefer_typing_uninitialized_variables
  final loadingColor;
  // ignore: use_key_in_widget_constructors
  const SmallButtonSizer(
      {@required this.onPressed,
        @required this.title,
        this.color = kPrimaryColor,
        this.isLoading = false,
        this.loadingColor = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: MediaQuery.of(context).size.height / 18,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            color: color ,
            borderRadius: BorderRadius.circular(8),
           // border: Border.all(color: kPrimaryColor, width: 1.5),
        ),
        child: Center(
          child: isLoading != true
              ? Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Contrail',
              color: color == null ? kPrimaryColor : Colors.white,
              fontSize: 18,
            ),
          )
              : SpinKitChasingDots(
            size: 20,
            color: loadingColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
