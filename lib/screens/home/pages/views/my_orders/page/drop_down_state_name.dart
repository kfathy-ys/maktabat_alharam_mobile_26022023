import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
enum TypeEntityName { submitted,responded,underReview,done,refused }

class DropDownListStatesOrders extends StatefulWidget {
  final String? initial;
  final ValueChanged<String> onChanged;
  const DropDownListStatesOrders({Key? key, this.initial, required this.onChanged})
      : super(key: key);

  @override
  State<DropDownListStatesOrders> createState() =>
      _DropDownListStatesOrdersState();
}

class _DropDownListStatesOrdersState extends State<DropDownListStatesOrders> {
  TypeEntityName? selected;
  String? valueSelected;
  @override
  void initState() {
    if (widget.initial != null) {
      if (widget.initial =="Submitted") {
        selected = TypeEntityName.submitted;
        valueSelected = widget.initial;
      } else if(widget.initial == "Responded"){
        selected = TypeEntityName.responded;
        valueSelected = widget.initial;
      }else if(widget.initial == "Pending"){
        selected = TypeEntityName.underReview;
        valueSelected = widget.initial;
      }else if(widget.initial == "Approved"){
        selected = TypeEntityName.done;
        valueSelected = widget.initial;
      }else {
        selected = TypeEntityName.refused;
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      // height: height*0.09,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: kPrimaryColor)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TypeEntityName>(
          value: selected,
          // autofocus: true,
          //isDense: true,
          isExpanded: true,
          hint: Text(
            "requestState".tr + ' :',
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
              if (selected == TypeEntityName.submitted) {
                valueSelected = "Submitted";
              } else if (selected == TypeEntityName.responded) {
                valueSelected = "Responded";
              }else if (selected == TypeEntityName.underReview) {
                valueSelected = "Pending";
              }else if (selected == TypeEntityName.done) {
                valueSelected = "Approved";
              }else {
                valueSelected = "Rejected";
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
