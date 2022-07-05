import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
enum TypeEntityName { requestToBuyBook, requestLibrarian,requestVisit,RequestDepositScientificThesis,RequestReserveArticleOrResearchRetreat }
class DropDownListOrderName extends StatefulWidget {


  final String? initial;
  final ValueChanged<String> onChanged;
  const DropDownListOrderName({Key? key, this.initial, required this.onChanged})
      : super(key: key);

  @override
  State<DropDownListOrderName> createState() => _DropDownListOrderNameState();
}

class _DropDownListOrderNameState extends State<DropDownListOrderName> {
  TypeEntityName? selected;
  String? valueSelected;
  @override
  void initState() {
    if (widget.initial != null) {
       if (widget.initial =="Suggestion") {
        selected = TypeEntityName.requestToBuyBook;
        valueSelected = widget.initial;
      } else if(widget.initial == "Inquiry"){
        selected = TypeEntityName.requestLibrarian;
        valueSelected = widget.initial;
      }else if(widget.initial == "VisitRequest"){
        selected = TypeEntityName.requestVisit;
        valueSelected = widget.initial;
      }else if(widget.initial == "ResearchRequest"){
        selected = TypeEntityName.RequestDepositScientificThesis;
        valueSelected = widget.initial;
      }else {
        selected = TypeEntityName.RequestReserveArticleOrResearchRetreat;
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

          isExpanded: true,
          hint: Text(
            "orderName".tr + ' :',
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
            if (selected == TypeEntityName.requestToBuyBook) {
                valueSelected = "Suggestion";
              } else if (selected == TypeEntityName.requestLibrarian) {
                valueSelected = "Inquiry";
              }else if (selected == TypeEntityName.requestVisit) {
                valueSelected = "VisitRequest";
              }else if (selected == TypeEntityName.RequestDepositScientificThesis) {
                valueSelected = "ResearchRequest";
              }else {
                valueSelected = "ThesisDeposition";
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
