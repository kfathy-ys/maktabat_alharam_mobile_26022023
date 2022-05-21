import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../config/dio_helper/dio.dart';
import '../archive/models/model.dart';

part 'my_archive_visit_state.dart';

class MyArchiveVisitCubit extends Cubit<MyArchiveVisitState> {
  MyArchiveVisitCubit() : super(MyArchiveVisitInitial()){
    getOrderArchiveVisit();
  }


  Future<void> getOrderArchiveVisit() async {
    emit(MyArchiveVisitLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('VisitRequest/GetArchivedVisitRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(MyArchiveVisitSuccess(archiveVisitModel:
      ArchiveVisitModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(MyArchiveVisitError(msg: e.toString()));
    }
  }
}
