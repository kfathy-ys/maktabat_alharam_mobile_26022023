import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/new_order/models/all_libraries_model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/all_grads_model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/available_dates_room_model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/date_convertors.dart';
import '../../../request_visit/new_order/models/available_dates_model.dart';
import '../../my_order/models/model.dart';
import '../models/all_room_model.dart';
import '../models/room_libraryId_model.dart';

part 'avalible_dates_research_state.dart';

class AvalibleDatesResearchCubit extends Cubit<AvalibleDatesResearchState> {
  AvalibleDatesResearchCubit() : super(AvalibleDatesResearchInitial());


   bool isResearchRetreat = false;
   bool isScientificMaterial = false;

 void selectService(int value){
   if(value == 11){
     isResearchRetreat = true;
    isScientificMaterial = false;
   }
   if(value == 12){
     isScientificMaterial = true;
     isResearchRetreat = false;
   }
   if(value == 13) {
     isScientificMaterial = true;
     isResearchRetreat = true;
   }
   emit(ServiceSelecetdState());
 }

  AllLibraries? selectedLIB;
  void onLibChang(AllLibraries value)=> selectedLIB = value;


  int? authorityID;
  int onAuthorityIDChanged(int value)=> authorityID= value;

  AllGrade? qualificationID;
  void onQualificationIDChanged(AllGrade value)=> qualificationID= value;


  AllRooms? roomsID;
  void onRoomsIDChanged(AllRooms value)=> roomsID= value;
 final rooms = <MyRoomLibraryId>[];


  Future<void> getAvailableDatesResearch(int libId) async {
    emit(AvalibleDatesResearchLoading());
    try {
      rooms.clear();
      final res =
      await NetWork.get('Room/GetRoomsByLibraryId/$libId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      (res.data['data'] as List).map((e) => rooms.add(MyRoomLibraryId.fromJson(e))).toList();
      //




      emit(AvalibleDatesResearchSuccess());
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AvalibleDatesResearchError(msg: e.toString()));
    }
  }


  final dates = <AvailableDatesByRoom>[];
  final availableDates = <DateTime>[];
  Future<void> getAvailableValidDatesResearch(int roomID) async {
    emit(AvalibleDatesResearchLoading());
    try {
      dates.clear();
      final res = await NetWork.get('ResearchRequest/GetResearchAvailableDatesByRoomId/$roomID');


      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      (res.data['data'] as List).map((e) => dates.add(AvailableDatesByRoom.fromJson(e))).toList();

      if(dates.isNotEmpty) {
        for(final date in dates){
          availableDates.add(date.date);
        }
      }

      emit(AvalibleDatesResearchSuccess(

      ));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AvalibleDatesResearchError(msg: e.toString()));
    }
  }




  final fullName = Prefs.getString('fullName');
  final email = Prefs.getString('email');
  final phoneNumber = Prefs.getString('phoneNumber');

  final createOrder = <MyOrdersToResearch>[];
 // int  visitDateId = 0;
  Future<void> createOrderToResearch({



    required String callNum,
  required int roomId  ,
    required dynamic numberOfVisitors,
    required String visitReason,
    // required int requestStatusId,
  }) async {
    try {

      var now = DateTime.now();
      var dataNow=  DateConverter.dateConverterOnly(now.toString());
      final userId = Prefs.getString("userId");
      final body = {

        "id": 0,
        "userId": userId,
        "libraryId": selectedLIB!.id,
        "roomId": null,
        "researchStartDateId": null,
        "researchEndDateId": null,
        "requestTypeId": authorityID!,
        "responsibleName": fullName,
        "responsibleMobile": phoneNumber,
        "responsibleGradeId": qualificationID!.id!,
        "callNum": callNum,
        "subjectName": null,
        "dateFrom": "2010-03-06T21:45:41.222Z",
        "dateTo": "1966-03-16T12:49:23.725Z",
        "reasonOfRejection": null,
        "instructions": null,
        "requestStatusId": 4,
        "isArchived": false,
        "createdBy": userId,
        "createdDate": dataNow,
        "updatedBy": null,
        "updatedDate": null

      };
      final res =
      await NetWork.post('ResearchRequest/CreateNewResearchRequest', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(CreateOrderSuccess(myOrdersToResearch:
      MyOrdersToResearch.fromJson(res.data)));


    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(CreateOrderError(msg: e.toString()));
    }
  }


  final selectedDates =<DateTime>[];
  void selectDay(DateTime day){
    selectedDates.add(day);
    emit(SelectedDatesState());
  }
}
