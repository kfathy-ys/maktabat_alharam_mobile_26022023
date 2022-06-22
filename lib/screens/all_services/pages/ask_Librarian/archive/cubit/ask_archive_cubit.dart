import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/archive/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'ask_archive_state.dart';

class AskArchiveCubit extends Cubit<AskArchiveState> {
  AskArchiveCubit() : super(AskArchiveInitial()) {
    getAskArchive();
  }

  var userId = Prefs.getString("userId");

  Future<void> getAskArchive() async {
    emit(AskArchiveLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Inquiry/GetArchivedInquiries/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(AskArchiveSuccess(
          askArchivedModel: AskArchivedModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AskArchiveError(msg: e.toString()));
    }
  }

  Future<void> addedAskToArchive(
      {required int id,
      required String visitorName,
      required String visitorEmail,
      required String visitorMobile,
      required String visitorMessage,
      required int type,
      required String createdDate}) async {
    try {
      var now = DateTime.now();
      final body = {
        "id": id,
        "type": type,
        "visitorName": visitorName,
        "visitorEmail": visitorEmail,
        "visitorMobile": visitorMobile,
        "visitorMessage": visitorMessage,
        "response": "",
        "isArchived": true,
        "createdBy": userId,
        "createdDate": createdDate,
        "updatedBy": userId,
        "updatedDate": DateFormat('yyyy-MM-dd').format(now)
      };
      final res = await NetWork.post('Inquiry/UpdateInquiry', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(AskArchiveSuccess(
          askArchivedModel: AskArchivedModel.fromJson(res.data)));
      await getAskArchive();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(AskArchiveError(msg: e.toString()));
    }
  }

  Future<void> removeAskFromArchive(
      {required int id,
      required String visitorName,
      required String visitorEmail,
      required String visitorMobile,
      required String visitorMessage,
      required int type,
      required String createdDate}) async {
    try {
      var now = DateTime.now();
      final body = {
        "id": id,
        "type": type,
        "visitorName": visitorName,
        "visitorEmail": visitorEmail,
        "visitorMobile": visitorMobile,
        "visitorMessage": visitorMessage,
        "response": "",
        "isArchived": false,
        "createdBy": userId,
        "createdDate": createdDate,
        "updatedBy": userId,
        "updatedDate": DateFormat('yyyy-MM-dd').format(now)
      };
      final res = await NetWork.post('Inquiry/UpdateInquiry', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(AskArchiveSuccess(
          askArchivedModel: AskArchivedModel.fromJson(res.data)));
      await getAskArchive();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(AskArchiveError(msg: e.toString()));
    }
  }
}
