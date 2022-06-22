import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

enum TypeBooks { paper, electronic }

class DropDownBookType extends StatefulWidget {
  final int? initial;
  final ValueChanged<int> onChanged;
  const DropDownBookType({Key? key, required this.onChanged, this.initial})
      : super(key: key);

  @override
  State<DropDownBookType> createState() => _DropDownBookTypeState();
}

class _DropDownBookTypeState extends State<DropDownBookType> {
  TypeBooks? selected;
  int? valueSelected;

  @override
  void initState() {
    if (widget.initial != null) {
      if (widget.initial == 19) {
        selected = TypeBooks.paper;
        valueSelected = widget.initial;
      } else {
        selected = TypeBooks.electronic;
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
        child: DropdownButton<TypeBooks>(
          value: selected,

          hint: Text(
            "bookType".tr + ' :',
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
          onChanged: (TypeBooks? newValue) {
            if (newValue == null) return;

            setState(() {
              selected = newValue;
              if (selected == TypeBooks.electronic) {
                valueSelected = 18;
              } else {
                valueSelected = 19;
              }
              widget.onChanged(valueSelected!);
            });
          },
          items: TypeBooks.values
              .map<DropdownMenuItem<TypeBooks>>((TypeBooks value) {
            return DropdownMenuItem<TypeBooks>(
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
          }).toList(),
        ),
      ),
    );
  }
}
