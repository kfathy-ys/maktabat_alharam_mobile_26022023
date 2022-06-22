import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../models/model.dart';

part 'my_archive_visit_state.dart';

class MyArchiveVisitCubit extends Cubit<MyArchiveVisitState> {
  MyArchiveVisitCubit() : super(MyArchiveVisitInitial()) {
    getOrderArchiveVisit();
  }

  var userId = Prefs.getString("userId");

  Future<void> getOrderArchiveVisit() async {
    emit(MyArchiveVisitLoading());
    try {
      final userId = Prefs.getString("userId");
      final res =
          await NetWork.get('VisitRequest/GetArchivedVisitRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(MyArchiveVisitSuccess(
          archiveVisitModel: ArchiveVisitModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(MyArchiveVisitError(msg: e.toString()));
    }
  }

  Future<void> addedVisitToArchive({
    required int id,
    required int libraryId,
    required int visitDateId,
    required int authority,
    required String responsibleName,
    required String responsibleMobile,
    required String responsibleEmail,
    required int numberOfVisitors,
    required String visitReason,
    required int requestStatusId,
    required String createdDate,
  }) async {
    try {
      final body = {
        "id": id,
        "userId": userId,
        "libraryId": libraryId,
        "visitDateId": visitDateId,
        "authority": authority,
        "responsibleName": responsibleName,
        "responsibleMobile": responsibleMobile,
        "responsibleEmail": responsibleEmail,
        "numberOfVisitors": numberOfVisitors,
        "visitReason": visitReason,
        "reasonOfRejection": null,
        "instructions": null,
        "requestStatusId": requestStatusId,
        "isArchived": true,
        "createdBy": userId,
        "createdDate": createdDate,
        "updatedBy": null,
        "updatedDate": null,
        "visitAvailableDate": null,
        "visitRequestReply": null
      };
      final res =
          await NetWork.post('VisitRequest/UpdateVisitRequest', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(MyArchiveVisitSuccess(
          archiveVisitModel: ArchiveVisitModel.fromJson(res.data)));
      await getOrderArchiveVisit();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(MyArchiveVisitError(msg: e.toString()));
    }
  }

  Future<void> removeVisitFromArchive({
    required int id,
    required int libraryId,
    required int visitDateId,
    required int authority,
    required String responsibleName,
    required String responsibleMobile,
    required String responsibleEmail,
    required int numberOfVisitors,
    required String visitReason,
    required int requestStatusId,
    required String createdDate,
  }) async {
    try {
      final body = {
        "id": id,
        "userId": userId,
        "libraryId": libraryId,
        "visitDateId": visitDateId,
        "authority": authority,
        "responsibleName": responsibleName,
        "responsibleMobile": responsibleMobile,
        "responsibleEmail": responsibleEmail,
        "numberOfVisitors": numberOfVisitors,
        "visitReason": visitReason,
        "reasonOfRejection": null,
        "instructions": null,
        "requestStatusId": requestStatusId,
        "isArchived": false,
        "createdBy": userId,
        "createdDate": createdDate,
        "updatedBy": null,
        "updatedDate": null,
        "visitAvailableDate": null,
        "visitRequestReply": null
      };

      /// TODO  Please update EndPoint
      final res =
          await NetWork.post('VisitRequest/UpdateVisitRequest', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(MyArchiveVisitSuccess(
          archiveVisitModel: ArchiveVisitModel.fromJson(res.data)));
      await getOrderArchiveVisit();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(MyArchiveVisitError(msg: e.toString()));
    }
  }
}
