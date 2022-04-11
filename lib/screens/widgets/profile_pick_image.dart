import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/loading.dart';

import 'constants.dart';

Widget profilePicContainer(BuildContext context, dynamic? img, String? name,
    String mobile, dynamic onProfilePicTapped, bool loading) {
  return Container(
     //width: MediaQuery.of(context).size.width,
//    height: 250,
    decoration: const BoxDecoration(
        //color: kSafeAreasColor,
        //     borderRadius: const BorderRadius.only(
        //
        //         bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        ),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(top: 20, end: 10),
      child: loading
          ? LoadingSmall()
          : Row(
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: onProfilePicTapped,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                          shape: BoxShape.circle,
                          image:img is String?DecorationImage(
                        fit: BoxFit.cover,
                              image:AssetImage(img)):
                          DecorationImage(
                              fit: BoxFit.cover ,
                              image:FileImage(img!))
                          //
                          // DecorationImage(
                          //     image: NetworkImage(img!),
                          //     fit: BoxFit.cover),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/image/tinyCamera.png"),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          mobile,
                          style: const TextStyle(
                            color: kTextFieldColor,
                            fontSize: 12,
                            fontFamily: "DinReguler",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    /*   const SizedBox(
                height: 6,
              )*/
                  ],
                ),
                const SizedBox(
                  width: 22,
                ),
                Text(
                  name!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    //  color: AppTheme.mainTextColor,
                    fontSize: 15,
                    color: kBlackText,
                    fontFamily: "DinLight",
                    // fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
    ),
  );
}
