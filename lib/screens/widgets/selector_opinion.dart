import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

enum Opinion { yes, no }

enum AvailableType { accept, refuse }

enum MultiChoose { one, two, three, four }

class SelectorOpenion extends StatefulWidget {
  final ValueChanged<String> onChange;
  const SelectorOpenion({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  _SelectorOpenionState createState() => _SelectorOpenionState();
}

class _SelectorOpenionState extends State<SelectorOpenion> {
  Opinion? _opinion;

  AvailableType accept = AvailableType.accept;
  MultiChoose multiChoose = MultiChoose.one;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView(
       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("DepositScientificThesis".tr,
                style: const TextStyle(
                    color: kPrimaryColor, fontSize: 16, fontFamily: 'DinBold')),
            SizedBox(
              width: width * 0.2,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Radio<Opinion>(
                  value: Opinion.yes,
                  activeColor: kAccentColor,
                  groupValue: _opinion,
                  onChanged: (_) {
                    _opinion = Opinion.yes;
                     widget.onChange("firstAvailabilitySelected");
                    setState(() {});
                  },
                ),
                Text('yes'.tr,
                    style: const TextStyle(
                        color: kBlackText,
                        fontSize: 14,
                        fontFamily: 'DinBold')),
              ]),
            ),
            SizedBox(
              width: width * 0.2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<Opinion>(
                    value: Opinion.no,
                    activeColor: kAccentColor,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => kAccentColor),
                    groupValue: _opinion,
                    onChanged: (_) {
                      setState(() {
                        widget.onChange("noOption");
                        _opinion = Opinion.no;
                        accept = AvailableType.accept;
                      });
                    },
                  ),
                  Text('no'.tr,
                      style: const TextStyle(
                          color: kBlackText,
                          fontSize: 14,
                          fontFamily: 'DinBold')),
                ],
              ),
            ),
          ],
        ),
        // Image.asset("assets/image/bigLine.png"),

        if (_opinion == Opinion.no)
          ListTile(
            horizontalTitleGap: 1,
            title: Text('noOpen'.tr,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
          ),

        if (_opinion == Opinion.yes) ...[
          Text("availabilityType".tr,
              style: const TextStyle(
                  color: kPrimaryColor, fontSize: 16, fontFamily: 'DinBold')),
          ListTile(
            horizontalTitleGap: 1,
            title: Text('oneOk'.tr,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<AvailableType>(
              value: AvailableType.accept,
              activeColor: kAccentColor,
              groupValue: accept,
              onChanged: (_) {
                setState(() {
                  widget.onChange("firstAvailabilitySelected");
                  accept = AvailableType.accept;
                });
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 1,
            title: Text('twoOk'.tr,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<AvailableType>(
              value: AvailableType.refuse,
              activeColor: kAccentColor,
              groupValue: accept,
              onChanged: (_) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithFirstOption");
                  accept = AvailableType.refuse;
                });
              },
            ),
          ),
        ],


        if (accept == AvailableType.refuse) ...[
          ListTile(
            horizontalTitleGap: 1,
            title: Text('ableAddressPlus'.tr,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<MultiChoose>(
              value: MultiChoose.one,
              activeColor: kAccentColor,
              groupValue: multiChoose,
              onChanged: (MultiChoose? value) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithFirstOption");
                  multiChoose = MultiChoose.one;
                });
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 1,
            title: Text('ableFour'.tr,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<MultiChoose>(
              value: MultiChoose.two,
              activeColor: kAccentColor,
              groupValue: multiChoose,
              onChanged: (MultiChoose? value) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithSecondOption");

                  multiChoose = MultiChoose.two;
                });
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 1,
            title: Text('ableFive'.tr,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<MultiChoose>(
              value: MultiChoose.three,
              activeColor: kAccentColor,
              groupValue: multiChoose,
              onChanged: (MultiChoose? value) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithThirdOption");

                  multiChoose = MultiChoose.three;
                });
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 1,
            title: Text('ableSix'.tr,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<MultiChoose>(
              value: MultiChoose.four,
              activeColor: kAccentColor,
              groupValue: multiChoose,
              onChanged: (MultiChoose? value) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithFourthOption");

                  multiChoose = MultiChoose.four;
                });
              },
            ),
          ),
        ],
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
