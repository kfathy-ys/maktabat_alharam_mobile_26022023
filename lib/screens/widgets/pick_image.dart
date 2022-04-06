import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';



TextStyle _textStyle = TextStyle(
    color: kPrimaryColor,
    fontFamily: "DinMedium",
    fontSize: 15,
    fontWeight: FontWeight.w800);
dynamic openImagePicker(
    {BuildContext? context, dynamic onGalleryTapped, dynamic onCameraTapped}) {
  showCupertinoModalPopup(
      context: context!,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoButton(
            child: Text(
             // context.locale.languageCode == "en" ?
              "Cancel",
                  //: "الغاء",
              style: _textStyle,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            CupertinoButton(
                child: Row(
                  children: <Widget>[
                    const Icon(
                      CupertinoIcons.photo_camera_solid,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                     // context.locale.languageCode == "en"
                         // ?
                    "Camera",
                        //  : "الكاميرا",
                      style: _textStyle,
                    ),
                  ],
                ),
                onPressed: onCameraTapped),
            CupertinoButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.insert_photo,
                      color:kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      // context.locale.languageCode == "en"
                      //     ?
                      "Gallery",
                       //   : "الاستوديو",
                      style: _textStyle,
                    ),
                  ],
                ),
                onPressed: onGalleryTapped),
          ],
        );
      });
}
