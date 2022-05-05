import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
class AvailableTime  extends StatelessWidget {
  final String time1;
  final String time2;

  const AvailableTime({Key? key,required this.time1,required this.time2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
   // double width = MediaQuery.of(context).size.width;
    return   Container(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 22),
      height: height * 0.089,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context , int index){
          return Container(
            height: height * 0.079,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12),

            decoration: BoxDecoration(
                color: kBackgroundCardColor,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                 // "6:35 PM\t\t".tr
                  time1,
                  style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontFamily: "DinReguler",
                ),),
                Text(
                  //"2:35 PM".tr,
                  time2,
                  style: const TextStyle(
                  color: kBlackText,
                  fontSize: 16,
                  fontFamily: "DinReguler",
                ),),
              ],
            ),

          );
        },

      ),
    );
  }
}
