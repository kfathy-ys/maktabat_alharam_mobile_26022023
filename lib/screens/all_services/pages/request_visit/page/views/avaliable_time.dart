import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../new_order/models/avalible_periods_model.dart';

class AvailableTime extends StatefulWidget {
  final List<AvailablePeriods> periods;

  const AvailableTime({
    Key? key,
    required this.periods,
  }) : super(key: key);

  @override
  State<AvailableTime> createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTime> {
 // bool isPressed = false;
  int _selectedTimeId=0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
      height: height * 0.089,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.periods.length,
        itemBuilder: (context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedTimeId = widget.periods[index].id!;
                Prefs.setBool("isClicked", true);
              });
            },
            child: Container(
              height: height * 0.079,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: _selectedTimeId ==widget.periods[index].id
                      ? Border.all(color: kHomeColor)
                      : Border.all(color: kAccentColor),
                  color: _selectedTimeId ==widget.periods[index].id ? kAccentColor : kHomeColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    // "6:35 PM\t\t".tr
                    widget.periods[index].periodFrom ?? '',
                    style: TextStyle(
                      color: _selectedTimeId ==widget.periods[index].id ? kHomeColor : kAccentColor,
                      fontSize: 16,
                      fontFamily: "DinReguler",
                    ),
                  ),
                  Text(
                    // "6:35 PM\t\t".tr
                    parseHtmlString(
                      widget.periods[index].periodOfTheDayFromAr ?? '',
                    ),

                    // widget.periods[index].periodOfTheDayFromAr ?? '',
                    style: TextStyle(
                      color: _selectedTimeId ==widget.periods[index].id ? kHomeColor : kAccentColor,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: "DinReguler",
                    ),
                  ),
                  const Text(
                    ' : ',
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 16,
                      fontFamily: "DinBold",
                    ),
                  ),
                  Text(
                    //"2:35 PM".tr,
                    widget.periods[index].periodTo ?? '',
                    style: TextStyle(
                      color: _selectedTimeId ==widget.periods[index].id ? kHomeColor : kAccentColor,
                      fontSize: 16,
                      fontFamily: "DinReguler",
                    ),
                  ),
                  Text(
                    parseHtmlString(
                        widget.periods[index].periodOfTheDayToAr ?? ''),
                    style: TextStyle(
                      color: _selectedTimeId ==widget.periods[index].id ? kHomeColor : kAccentColor,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontFamily: "DinReguler",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
