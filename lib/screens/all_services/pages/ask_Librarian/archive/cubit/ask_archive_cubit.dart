import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/archive/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'ask_archive_state.dart';

class AskArchiveCubit extends Cubit<AskArchiveState> {
  AskArchiveCubit() : super(AskArchiveInitial()){
    getAskArchive();
  }


  Future<void> getAskArchive() async {
    emit(AskArchiveLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Inquiry/GetArchivedInquiries/$userId');

      if (res.data['status'] == 0 || res.data['status'] == -1 || res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(AskArchiveSuccess(askArchivedModel: AskArchivedModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AskArchiveError(msg:e.toString()));
    }
  }
}
