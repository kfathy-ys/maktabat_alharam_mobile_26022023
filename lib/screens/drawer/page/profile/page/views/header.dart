import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class HeaderTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const HeaderTitle({Key? key, required this.icon, required this.title})
      : super(key: key);

  //"myProfile".tr
  //Icons.person
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 30,
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Text(title,
                style: const TextStyle(
                    color: kBlackText, fontSize: 18, fontFamily: 'DinMedium')),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Image.asset(
          'assets/image/line.png',
        ),
      ],
    );
  }
}
