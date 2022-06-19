import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/new_order/models/all_libraries_model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/all_room_model.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

import '../../../../../config/dio_helper/dio.dart';
import '../new_order/cubit_avalible_dates_research/avalible_dates_research_cubit.dart';
import '../new_order/models/room_libraryId_model.dart';
class DropDownListHallName extends StatefulWidget {

  final List<MyRoomLibraryId> rooms;
  final MyRoomLibraryId? initial;
  final ValueChanged<MyRoomLibraryId> onChanged;

  const DropDownListHallName({Key? key,required this.onChanged ,this.initial, required this.rooms}) : super(key: key);

  @override
  State<DropDownListHallName> createState() => _DropDownListHallNameState();
}

class _DropDownListHallNameState extends State<DropDownListHallName> {
  MyRoomLibraryId? selected;
  int? valueSelected;
  AllLibraries? _allLibraries;
  @override
  void initState() {
    if(widget.initial != null) {
      selected = widget.initial;
    }


     // getAllRooms();
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
        child: DropdownButton<MyRoomLibraryId>(

          value: selected,

          hint: Text("hallName".tr+' :',
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
          onChanged: (MyRoomLibraryId? newValue) {
            if (newValue == null) return;
            selected = newValue;

            widget.onChanged(selected!);

            setState(() {});
          },
          items:  widget.rooms
              .map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text( value.nameAr!,
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

  // Future<void> getAllRooms()async{
  //   rooms.clear();
  //   final res = await NetWork.get('Room/GetAllRooms');
  //   (res.data['data'] as List).map((e) => rooms.add(AllRooms.fromJson(e))).toList();
  //   setState(() {});
  //
  // }
}
