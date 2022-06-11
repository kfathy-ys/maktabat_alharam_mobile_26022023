import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../models/model.dart';

part 'archived_order_state.dart';

class ArchivedOrderCubit extends Cubit<ArchivedOrderState> {
  ArchivedOrderCubit() : super(ArchivedOrderInitial()){
    getOrderArchiveResearch();
  }


  var userId = Prefs.getString("userId");

  Future<void> getOrderArchiveResearch() async {
    emit(ArchivedOrderLoading());
    try {
      final userId = Prefs.getString("userId");
      final res =
      await NetWork.get('ResearchRequest/GetArchivedResearchRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(ArchivedOrderSuccess(archivedResearchModel:
      ArchivedResearchModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(ArchivedOrderError(msg: e.toString()));
    }
  }

}
