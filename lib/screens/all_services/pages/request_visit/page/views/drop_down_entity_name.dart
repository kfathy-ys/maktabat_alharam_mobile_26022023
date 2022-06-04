import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
enum typeEntityName {school ,company,entity}
class DropDownEntityName extends StatefulWidget {
  final int? initial;
  final ValueChanged<int> onChanged;
   const DropDownEntityName({Key? key, this.initial, required this.onChanged}) : super(key: key);

  @override
  State<DropDownEntityName> createState() => _DropDownEntityNameState();
}

class _DropDownEntityNameState extends State<DropDownEntityName> {
  typeEntityName? selected;
  int? valueSelected;



  @override
  void initState() {
    if(widget.initial != null) {
      if(widget.initial == 1){
        selected = typeEntityName.school;
        valueSelected = widget.initial;
      }else if(widget.initial == 2){
        selected = typeEntityName.company;
        valueSelected = widget.initial;
      }else{
        selected = typeEntityName.entity;
        valueSelected = widget.initial;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal:35 ,vertical: 8),
      width: width,
     // height: height*0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
          border: Border.all(color: kPrimaryColor)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<typeEntityName>(

          value: selected,

          hint: Text("entityName".tr+' :',
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontFamily: "DinReguler",
            ),),
          borderRadius: BorderRadius.circular(10),
          icon: Image.asset("assets/image/smallarrow.png"),
        //  elevation: 16,
          style: const TextStyle(
            color: kTextColor,
            fontSize: 16,
            fontFamily: "DinReguler",
          ),
           underline: null,
          onChanged: (typeEntityName? newValue) {
            if (newValue == null) return;

            setState(() {
              selected = newValue;
              if (selected == typeEntityName.school) {
                valueSelected = 1;
              }
              else if (selected == typeEntityName.company){
                valueSelected = 2;
              }
              else {
                valueSelected = 3;
              }
              widget.onChanged(valueSelected!);
            });
          },
          items: typeEntityName.values
              .map<DropdownMenuItem<typeEntityName>>((typeEntityName value) {
            return DropdownMenuItem<typeEntityName>(
              value: value,
              child: Text(describeEnum(value).tr,
                style: const TextStyle(
                  color: kTextColor,
                  fontSize: 16,
                  fontFamily: "DinReguler",
                ),


              ),
            );
          }).toList()
        ),
      ),
    );
  }
}
