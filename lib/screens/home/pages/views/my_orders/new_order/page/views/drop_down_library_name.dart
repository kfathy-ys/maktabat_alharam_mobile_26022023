import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class DropDownListLibraryName extends StatefulWidget {
  const DropDownListLibraryName({Key? key}) : super(key: key);

  @override
  State<DropDownListLibraryName> createState() =>
      _DropDownListLibraryNameState();
}

class _DropDownListLibraryNameState extends State<DropDownListLibraryName> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
      width: width,
      // height: height*0.09,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: kPrimaryColor)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          // autofocus: true,
          // isDense: true,
          //isExpanded: true,
          hint: Text(
            "libraryName".tr + ' :',
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontFamily: "DinReguler",
            ),
          ),
          borderRadius: BorderRadius.circular(10),
          icon: Image.asset("assets/image/smallarrow.png"),
          //  elevation: 16,
          style: const TextStyle(
            color: kTextColor,
            fontSize: 16,
            fontFamily: "DinReguler",
          ),
          underline: null,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            "theHolyHaramLibraryMen".tr,
            "theHolyHaramLibraryWoman".tr
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: kTextColor,
                  fontSize: 16,
                  fontFamily: "DinReguler",
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
