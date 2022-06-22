import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/all_grads_model.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

import '../../../../../config/dio_helper/dio.dart';

//enum typeEntityName {phDStudent ,masterStudent,phDStudentPresidency}
class DropDownListQualifications extends StatefulWidget {
  final AllGrade? initial;
  final ValueChanged<AllGrade> onChanged;
  const DropDownListQualifications(
      {Key? key, this.initial, required this.onChanged})
      : super(key: key);
  @override
  State<DropDownListQualifications> createState() =>
      _DropDownListQualificationsState();
}

class _DropDownListQualificationsState
    extends State<DropDownListQualifications> {
  AllGrade? selected;
  final grads = <AllGrade>[];
  int? valueSelected;
  @override
  void initState() {
    if (widget.initial != null) {
      selected = widget.initial;
    }
    getQualifications();
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
        child: DropdownButton<AllGrade>(
          value: selected,

          isExpanded: true,

          hint: Text(
            "qualifications".tr + ' :',
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
          onChanged: (AllGrade? newValue) {
            if (newValue == null) return;
            selected = newValue;

            widget.onChanged(selected!);

            setState(() {});
          },
          items: grads.map<DropdownMenuItem<AllGrade>>((AllGrade value) {
            return DropdownMenuItem<AllGrade>(
              value: value,
              child: Text(
                value.valueArabic!,
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

  Future<void> getQualifications() async {
    grads.clear();
    final res = await NetWork.get('ResearchRequest/GetGrades');
    (res.data['data'] as List)
        .map((e) => grads.add(AllGrade.fromJson(e)))
        .toList();
    setState(() {});
  }
}
