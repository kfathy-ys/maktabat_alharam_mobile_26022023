// ignore_for_file: file_names, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class CustomCardButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final IconData? icon;
  final bool isLoading;
  const CustomCardButton(
      {this.onPressed, this.title, this.color, this.isLoading = false, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 14),
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 1.2,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading != true
                ? Row(
              children: [
                Icon(icon!,color: kCardBorder,size: 28,),
                SizedBox(width: 6,),
                Text(
                  title!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'DinMedium',
                      fontSize: 16
                  ),
                ),

              ],
            )
                : const SpinKitChasingDots(
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        color: color ?? kPrimaryColor,
        onPressed: onPressed,
        elevation: 0,
      ),
    );
  }
}
