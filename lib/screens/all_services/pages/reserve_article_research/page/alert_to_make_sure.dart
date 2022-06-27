import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height*0.079,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //   const SizedBox(width: 20.0, ),
          // const Text(
          //   'تحذير هام !',
          //   style: TextStyle(
          //       fontSize: 20.0, color: kSafeAreasColor, fontFamily: 'DinBold'),
          // ),
          const SizedBox(width: 30.0, ),
          DefaultTextStyle(
            style: const TextStyle(
                color: kAccentColor, fontSize: 18, fontFamily: 'DinBold'),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'تحذير هام ! ',textStyle: const TextStyle(
                    color: kButtonRedDark, fontSize: 20, fontFamily: 'DinBold'),
                ),
                TyperAnimatedText(
                  'عزيزي العميل ! ',textStyle: buildTextStyle(),
                ),
                TyperAnimatedText(
                  'يرجي إدخال تاريخ من التواريخ المتاحة فقط ',textStyle:buildAccentTextStyle(),
                ),
                TyperAnimatedText('للعلم ! التاريخ الغير متاح لم يؤخد بة',textStyle:buildAccentTextStyle()),
                TyperAnimatedText('تنوبة ! التاريخ الغير متاح يعمل بها فقط',textStyle: buildAccentTextStyle()),
                TyperAnimatedText('في حالة إختيارك لمادة علمية فقط',textStyle: buildTextStyle()),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ],
      ),
    );
  }

  TextStyle buildTextStyle() {
    return const TextStyle(
                  color: kSafeAreasColor, fontSize: 18, fontFamily: 'DinBold');
  }
  TextStyle buildAccentTextStyle() {
    return const TextStyle(
        color: kAccentColor, fontSize: 18, fontFamily: 'DinBold');
  }
}
