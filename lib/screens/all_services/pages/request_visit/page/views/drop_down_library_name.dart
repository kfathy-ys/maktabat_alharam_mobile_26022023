import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../new_order/models/all_libraries_model.dart';

// enum typeLibraryName {theHolyHaramLibraryMen ,theHolyHaramLibraryWoman}
class DropDownListLibraryName extends StatefulWidget {
  final ValueChanged<AllLibraries> onChanged;
  final AllLibraries? initial;
  const DropDownListLibraryName(
      {Key? key, required this.onChanged, this.initial})
      : super(key: key);

  @override
  State<DropDownListLibraryName> createState() =>
      _DropDownListLibraryNameState();
}

class _DropDownListLibraryNameState extends State<DropDownListLibraryName> {
  AllLibraries? selected;
  final libs = <AllLibraries>[];
  @override
  void initState() {
    if (widget.initial != null) {
      selected = widget.initial;
    }
    getLibs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  double height = MediaQuery.of(context).size.height;
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
        child: DropdownButton<AllLibraries>(
          value: selected,

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
          onChanged: (AllLibraries? newValue) {
            if (newValue == null) return;
            selected = newValue;

            widget.onChanged(selected!);

            setState(() {});
          },
          items: libs.map<DropdownMenuItem<AllLibraries>>((AllLibraries value) {
            return DropdownMenuItem<AllLibraries>(
              value: value,
              child: Text(
                value.nameAr!,
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

  Future<void> getLibs() async {
    libs.clear();
    final res = await NetWork.get('Library/GetAllLibraries');
    (res.data['data'] as List)
        .map((e) => libs.add(AllLibraries.fromJson(e)))
        .toList();
    setState(() {});
  }
}
