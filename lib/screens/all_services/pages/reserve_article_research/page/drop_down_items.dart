import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
// ignore: must_be_immutable

enum TypeEntityName { researchRetreat, scientificMaterial, mix }

class DropDownListServiceName extends StatefulWidget {
  final int? initial;
  final ValueChanged<int> onChanged;
  const DropDownListServiceName(
      {Key? key, this.initial, required this.onChanged})
      : super(key: key);
  @override
  State<DropDownListServiceName> createState() =>
      _DropDownListServiceNameState();
}

class _DropDownListServiceNameState extends State<DropDownListServiceName> {
  TypeEntityName? selected;
  int? valueSelected;
  @override
  void initState() {
    if (widget.initial != null) {
      if (widget.initial == 11) {
        selected = TypeEntityName.researchRetreat;
        valueSelected = widget.initial;
      } else if (widget.initial == 12) {
        selected = TypeEntityName.scientificMaterial;
        valueSelected = widget.initial;
      } else {
        selected = TypeEntityName.mix;
        valueSelected = widget.initial;
      }
    }
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
        child: DropdownButton<TypeEntityName>(
            value: selected,
            isExpanded: true,
            hint: Text(
              "serviceName".tr + ' :',
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
            onChanged: (TypeEntityName? newValue) {
              if (newValue == null) return;

              setState(() {
                selected = newValue;
                if (selected == TypeEntityName.researchRetreat) {
                  /// TODO:: 1,2,3
                  valueSelected = 11;
                } else if (selected == TypeEntityName.scientificMaterial) {
                  /// TODO:: 1,2,3
                  valueSelected = 12;
                } else {
                  valueSelected = 13;
                }
                widget.onChanged(valueSelected!);
              });
            },
            items: TypeEntityName.values
                .map<DropdownMenuItem<TypeEntityName>>((TypeEntityName value) {
              return DropdownMenuItem<TypeEntityName>(
                value: value,
                child: Text(
                  describeEnum(value).tr,
                  style: const TextStyle(
                    color: kTextColor,
                    fontSize: 16,
                    fontFamily: "DinReguler",
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
