import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';




class PickedFile extends StatefulWidget {
  const PickedFile({Key? key}) : super(key: key);

  @override
  _PickedFileState createState() => _PickedFileState();
}

class _PickedFileState extends State<PickedFile> {
  @override
  Widget build(BuildContext context) {
    return Center() ;

    //
    //   selectVideosStaticContainer(context, () {
    //   _uploadFile();
    //   // _uploadFile();
    // }, _file == null ? true : false);
  }

  // File? _file;
  // void _uploadFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: [
  //       'jpg', 'pdf', 'doc'
  //       // "MP4",
  //       // "MOV",
  //       // "WMV",
  //       // "AVI",
  //       // "AVCHD",
  //       // "FLV",
  //       // "F4V",
  //       // "SWF",
  //       // "MKV",
  //       // "WEBM",
  //       // "HTML5"
  //     ],
  //   );
  //
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //     print("-=-=-=-=- selected file is ${file.toString()}");
  //     setState(() {
  //       _file = file;
  //       _inputData.video = file;
  //     });
  //   } else {
  //     // User canceled the picker
  //   }
  // }
  //
  // Widget selectVideosStaticContainer(
  //     BuildContext context, VoidCallback onTap, bool isNull) {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Align(
  //             // alignment: context.locale.languageCode == "en"
  //             //     ? Alignment.centerLeft
  //             //     : Alignment.centerRight,
  //             child: Text(isNull
  //             ? 'فارغ':"تم رفع الفيديو بنجاح",
  //                 // ? LocaleKeys.Auctions_YouCanAddVideo
  //                 // : context.locale.languageCode == "en"
  //                 // ? "Video uploaded successfully"
  //                 // : "تم رفع الفيديو بنجاح"
  //
  //
  //             )
  //                // .tr()
  //
  //
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(bottom: 40),
  //         child: InkWell(
  //           onTap: onTap,
  //           child: const Center(
  //               child: Icon(
  //                 Icons.video_collection_rounded,
  //                 size: 30,
  //               )),
  //         ),
  //       ),
  //     ],
  //   );
  // }

/*  PlatformFile? file;
  void _uploadFile() async {
    filePredix.FilePickerResult result =
    await filePredix.FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      // print(file.name);
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
      setState(() {
        file = file;
        _filesList.add(file);
        _inputData.attachments = _filesList;
      });
    } else {
      _inputData.attachments = null;
      // User canceled the picker
    }
  }

  List<PlatformFile> _filesList = [];
  Widget _attachmentItem(BuildContext context, String text, Function onTap,
      Function onRemoveTapped, bool isAvailableAdd) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        // height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _uploadFile();
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 8, right: 8),
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppTheme.secondaryColor,
                          fontFamily: AppTextStyle.fontFamilyRegular),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ).tr(),
                  )
                // profileDropDownTextField(text, onTap),
              ),
            ),
            !isAvailableAdd
                ? Container(
              width: 30,
              height: 30,
            )
                : IconButton(
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: Color(getColorHexFromStr("#2A6B0E")),
                ),
                onPressed: () {
                  _uploadFile();
                }),
            IconButton(
                icon: Icon(
                  Icons.remove,
                  size: 30,
                  color: Color(getColorHexFromStr("#EF4158")),
                ),
                onPressed: onRemoveTapped),
          ],
        ),
      ),
    );
  }*/
}
