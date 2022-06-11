import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/date_convertors.dart';
import '../models/model.dart';

part 'archived_order_state.dart';

class ArchivedOrderCubit extends Cubit<ArchivedOrderState> {
  ArchivedOrderCubit() : super(ArchivedOrderInitial()) {
    getOrderArchiveResearch();
  }

  var userId = Prefs.getString("userId");

  Future<void> getOrderArchiveResearch() async {
    emit(ArchivedOrderLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'ResearchRequest/GetArchivedResearchRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(ArchivedOrderSuccess(
          archivedResearchModel: ArchivedResearchModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(ArchivedOrderError(msg: e.toString()));
    }
  }

  Future<void> addedResearchToArchive({
    required int id,
    required int libraryId,
    required int requestTypeId,
    required int responsibleGradeId,
    required String responsibleName,
    required String responsibleMobile,
    required String responsibleEmail,
    required String callNum,
    required int requestStatusId,
    required String createdDate,
    required String dateFrom,
    required String dateTo,
    required dynamic roomId,
  }) async {
    try {
      var now = DateTime.now();
      var dataNow = DateConverter.dateConverterOnly(now.toString());
      final body = {
        "id": id,
        "userId": userId,
        "libraryId": libraryId,
        "roomId": roomId,
        "researchStartDateId": null,
        "researchEndDateId": null,
        "requestTypeId": requestTypeId,
        "responsibleName": responsibleName,
        "responsibleMobile": responsibleMobile,
        "responsibleGradeId": responsibleGradeId,
        "callNum": callNum,
        "subjectName": null,
        "dateFrom": dateFrom,
        "dateTo":dateTo,
        "reasonOfRejection": null,
        "instructions": null,
        "requestStatusId": requestStatusId,
        "isArchived": true,
        "createdBy": userId,
        "createdDate": createdDate,
        "updatedBy": userId,
        "updatedDate": dataNow,
        "room": null,
        "researchAvailableStartDate": null,
        "researchAvailableEndDate": null,
        "researchRequestReply": null
      };
      final res = await NetWork.post('ResearchRequest/UpdateResearchRequest',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(ArchivedOrderSuccess(
          archivedResearchModel: ArchivedResearchModel.fromJson(res.data)));
      await getOrderArchiveResearch();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ArchivedOrderError(msg: e.toString()));
    }
  }

  Future<void> removeResearchFromArchive({
    required int id,
    required int libraryId,
    required int requestTypeId,
    required int responsibleGradeId,
    required String responsibleName,
    required String responsibleMobile,
    required String responsibleEmail,
    required String callNum,
    required int requestStatusId,
    required String createdDate,
    required String dateFrom,
    required String dateTo,
    required dynamic roomId,

  }) async {
    try {
      var now = DateTime.now();
      var dataNow = DateConverter.dateConverterOnly(now.toString());
      final body = {
        "id": id,
        "userId": userId,
        "libraryId": libraryId,
        "roomId": roomId,
        "researchStartDateId": null,
        "researchEndDateId": null,
        "requestTypeId": requestTypeId,
        "responsibleName": responsibleName,
        "responsibleMobile": responsibleMobile,
        "responsibleGradeId": responsibleGradeId,
        "callNum": callNum,
        "subjectName": null,
        "dateFrom": dateFrom,
        "dateTo":dateTo,
        "reasonOfRejection": null,
        "instructions": null,
        "requestStatusId": requestStatusId,
        "isArchived": false,
        "createdBy": userId,
        "createdDate": createdDate,
        "updatedBy": userId,
        "updatedDate": dataNow,
        "room": null,
        "researchAvailableStartDate": null,
        "researchAvailableEndDate": null,
        "researchRequestReply": null



      };

      /// TODO  Please update EndPoint
      final res = await NetWork.post('ResearchRequest/UpdateResearchRequest',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(ArchivedOrderSuccess(
          archivedResearchModel: ArchivedResearchModel.fromJson(res.data)));
      await getOrderArchiveResearch();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ArchivedOrderError(msg: e.toString()));
    }
  }
}
