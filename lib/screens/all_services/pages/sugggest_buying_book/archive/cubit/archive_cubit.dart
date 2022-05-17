import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/archive/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(ArchiveInitial()) {
    getOrderArchiveSuggest();
  }

 // OrderArchive? archiveSuggestModel;


  var userId = Prefs.getString("userId");

  Future<void> getOrderArchiveSuggest() async {
    emit(ArchiveLoading());
    try {
      final userId = Prefs.getString("userId");
      final res =
          await NetWork.get('Suggestion/GetArchivedSuggestions/$userId');

      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(ArchiveSuccess(
          archiveSuggestModel: OrderArchiveSuggestModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(ArchiveError(msg: e.toString()));
    }
  }

  Future<void> addedToArchive({
    required int id,
    required String visitorName,
    required String visitorEmail,
    required String visitorMobile,
    required String qualifications,
    required String bookTitle,
    required String authorName,
    required int typeBookId,
    required String publisherName,
    required String placeOfPublication,
    required String yearOfPublication,
    required String standardBookNumber,
    required String additionalInformation,
  }) async {
    try {
      var now = DateTime.now();
      final body = {
        "id": id,
        "visitorName": visitorName,
        "visitorEmail": visitorEmail,
        "visitorMobile": visitorMobile,
        "qualifications": qualifications,
        "suggestedBookTitle": bookTitle,
        "authorName": authorName,
        "publisherName": publisherName,
        "placeOfPublication": placeOfPublication,
        "yearOfPublication": yearOfPublication,
        "standardBookNumber": standardBookNumber,
        "bookTypeId": typeBookId ,
        "additionalInformation": additionalInformation,
        "isArchived": true,
        "createdBy": userId,
        "createdDate": DateFormat('yyyy-MM-dd').format(now),
        "updatedBy": userId,
        "updatedDate": DateFormat('yyyy-MM-dd').format(now)
      };
      final res = await NetWork.post('Suggestion/UpdateSuggestion', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(ArchiveSuccess(
          archiveSuggestModel: OrderArchiveSuggestModel.fromJson(res.data)));
      await getOrderArchiveSuggest();

    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ArchiveError(msg: e.toString()));
    }
  }








  Future<void> removeFromArchive({
    required int id,
    required String visitorName,
    required String visitorEmail,
    required String visitorMobile,
    required String qualifications,
    required String bookTitle,
    required String authorName,
    required String publisherName,
    required int typeBookId,
    required String placeOfPublication,
    required String yearOfPublication,
    required String standardBookNumber,
    required String additionalInformation,
  }) async {
    try {
      var now = DateTime.now();
      final body = {
        "id": id,
        "visitorName": visitorName,
        "visitorEmail": visitorEmail,
        "visitorMobile": visitorMobile,
        "qualifications": qualifications,
        "suggestedBookTitle": bookTitle,
        "authorName": authorName,
        "publisherName": publisherName,
        "placeOfPublication": placeOfPublication,
        "yearOfPublication": yearOfPublication,
        "standardBookNumber": standardBookNumber,
        "bookTypeId": typeBookId,
        "additionalInformation": additionalInformation,
        "isArchived": false,
        "createdBy": userId,
        "createdDate": DateFormat('yyyy-MM-dd').format(now),
        "updatedBy": userId,
        "updatedDate": DateFormat('yyyy-MM-dd').format(now)
      };
      final res = await NetWork.post('Suggestion/UpdateSuggestion', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(ArchiveSuccess(
          archiveSuggestModel: OrderArchiveSuggestModel.fromJson(res.data)));
      await getOrderArchiveSuggest();

    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ArchiveError(msg: e.toString()));
    }
  }


}
