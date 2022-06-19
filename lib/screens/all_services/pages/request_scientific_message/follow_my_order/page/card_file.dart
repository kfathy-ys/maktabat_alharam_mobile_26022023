import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/smallButtonSizerUploadFile.dart';
class CardFile extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final VoidCallback onPressed1;
   const CardFile({Key? key,required this.height ,required this.width , required this. title,

     required this. onPressed1,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kCardBorder)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width,
                child: SizedBox(
                  width: width*0.2,
                  child: Text(title,style:const TextStyle(
                    fontSize: 14,

                    color: kPrimaryColor,
                    fontFamily: "DinBold",
                  ),),
                ),
              ),
              SmallButtonSizerUploadFile(
                title: "downloadFile".tr,
                onPressed: onPressed1,
                color: kAccentColor,
                image: "assets/image/download.png",
              ),

            ],
          ),

        ],
      ),
    );
  }
}
