import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/all_university.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

import '../../../../../../config/dio_helper/dio.dart';

class DropDownListUniversityName extends StatefulWidget {
  final AllUni? initial;
  final ValueChanged<AllUni> onChanged;
  const DropDownListUniversityName({Key? key, this.initial, required this.onChanged}) : super(key: key);

  @override
  State<DropDownListUniversityName> createState() =>
      _DropDownListUniversityNameState();
}

class _DropDownListUniversityNameState
    extends State<DropDownListUniversityName> {
  AllUni? selected;
  final grads = <AllUni>[];
  int? valueSelected;
  @override
  void initState() {
    if (widget.initial != null) {
      selected = widget.initial;
    }
    getUni();
    super.initState();
  }
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
        child: DropdownButton<AllUni>(
          value: selected,
          // autofocus: true,
          // isDense: true,
          //isExpanded: true,
          hint: Text(
            "university".tr + ' :',
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
          onChanged: (AllUni? newValue) {
            if (newValue == null) return;
            selected = newValue;

            widget.onChanged(selected!);

            setState(() {});
          },
          items: grads.map<DropdownMenuItem<AllUni>>((AllUni value) {
            return DropdownMenuItem<AllUni>(
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
  Future<void> getUni() async {
    grads.clear();
    final res = await NetWork.get('ThesisDepositionRequest/GetAllUniversities');
    (res.data['data'] as List)
        .map((e) => grads.add(AllUni.fromJson(e)))
        .toList();
    setState(() {});

  }
}
