import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/date_convertors.dart';
import '../models/model.dart';

part 'archived_thesis_state.dart';

class ArchivedThesisCubit extends Cubit<ArchivedThesisState> {
  ArchivedThesisCubit() : super(ArchivedThesisInitial()) {
    getOrderArchivedThesis();
  }

  Future<void> getOrderArchivedThesis() async {
    emit(ArchivedThesisLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'ThesisDepositionRequest/GetArchivedThesisDepositionRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(ArchivedThesisSuccess(
          archivedThesisModel: ArchivedThesisModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(ArchivedThesisError(msg: e.toString()));
    }
  }

  final userId = Prefs.getString("userId");

  Future<void> addedThesisToArchive({
    required int id,
    required int universityId,
    required String applicantName,
    required String faculty,
    required String department,
    required String mobile,
    required String email,
    required String thesisData,
    required String thesisTitle,
    required String scientificDegree,
    required String yearOfDiscussion,
    required int numberOfPages,
    required int numberOfParts,
    required int requestStatusId,
    required String createdDate,
    required String thesisFile,
    required int availabilityType,
    required bool isAvailable,
    required bool isAvailableWithChains,
  }) async {
    try {
      final body = {
        "id": id,
        "userId": userId,
        "applicantName": applicantName,
        "universityId": universityId,
        "faculty": faculty,
        "department": department,
        "mobile": mobile,
        "email": email,
        "thesisData": thesisData,
        "thesisTitle": thesisTitle,
        "scientificDegree": scientificDegree,
        "yearOfDiscussion": yearOfDiscussion,
        "numberOfPages": numberOfPages,
        "numberOfParts": numberOfParts,
        "isAvailable": isAvailable,
        "isAvailableWithChains": isAvailableWithChains,
        "availabilityType": availabilityType,
        "thesisFile": thesisFile,
        "thesisTitleFile": null,
        "subjectsIndexFile": null,
        "arabicExtractFile": null,
        "englishExtractFile": null,
        "introFile": null,
        "collectionFile": null,
        "quarterCollectionFile": null,
        "callNum": null,
        "requestStatusId": requestStatusId,
        "isArchived": true,
        "reasonOfRejection": null,
        "instructions": null,
        "createdBy": userId,
        "createdDate": DateConverter.dateConverterMonth(createdDate),
        "updatedBy": null,
        "updatedDate": null,
        "thesisDepositionRequestReply": null
      };
      final res = await NetWork.post(
          'ThesisDepositionRequest/UpdateThesisDepositionRequest',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(ArchivedThesisSuccess(
          archivedThesisModel: ArchivedThesisModel.fromJson(res.data)));
      await getOrderArchivedThesis();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ArchivedThesisError(msg: e.toString()));
    }
  }

  Future<void> removeThesisFromArchive({
    required int id,
    required int universityId,
    required String applicantName,
    required String faculty,
    required String department,
    required String mobile,
    required String email,
    required String thesisData,
    required String thesisTitle,
    required String scientificDegree,
    required String yearOfDiscussion,
    required int numberOfPages,
    required int numberOfParts,
    required int requestStatusId,
    required String createdDate,
    required String thesisFile,
    required int availabilityType,
    required bool isAvailable,
    required bool isAvailableWithChains,
  }) async {
    try {
      final body = {
        "id": id,
        "userId": userId,
        "applicantName": applicantName,
        "universityId": universityId,
        "faculty": faculty,
        "department": department,
        "mobile": mobile,
        "email": email,
        "thesisData": thesisData,
        "thesisTitle": thesisTitle,
        "scientificDegree": scientificDegree,
        "yearOfDiscussion": yearOfDiscussion,
        "numberOfPages": numberOfPages,
        "numberOfParts": numberOfParts,
        "isAvailable": isAvailable,
        "isAvailableWithChains": isAvailableWithChains,
        "availabilityType": availabilityType,
        "thesisFile": thesisFile,
        "thesisTitleFile": null,
        "subjectsIndexFile": null,
        "arabicExtractFile": null,
        "englishExtractFile": null,
        "introFile": null,
        "collectionFile": null,
        "quarterCollectionFile": null,
        "callNum": null,
        "requestStatusId": requestStatusId,
        "isArchived": false,
        "reasonOfRejection": null,
        "instructions": null,
        "createdBy": userId,
        "createdDate": DateConverter.dateConverterMonth(createdDate),
        "updatedBy": null,
        "updatedDate": null,
        "thesisDepositionRequestReply": null
      };

      /// TODO  Please update EndPoint
      final res = await NetWork.post(
          'ThesisDepositionRequest/UpdateThesisDepositionRequest',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(ArchivedThesisSuccess(
          archivedThesisModel: ArchivedThesisModel.fromJson(res.data)));
      await getOrderArchivedThesis();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ArchivedThesisError(msg: e.toString()));
    }
  }
}
