import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../my_orders/models/model.dart';
import '../models/model.dart';
import '../models/replies_model.dart';

part 'replies_state.dart';

class RepliesCubit extends Cubit<RepliesState> {
  final int? id;

  RepliesCubit({required this.id}) : super(RepliesInitial()) {
    getFollowRepliesVisit(visitRequestId: id!);
  }

  var userId = Prefs.getString("userId");

  Future<void> getFollowRepliesVisit({required int visitRequestId}) async {
    emit(RepliesLoading());
    try {
      // final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'VisitRequest/GetAllVisitRequestReplies/$visitRequestId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(RepliesSuccess(
          repliesMessagesModel: RepliesMessagesModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(RepliesError(msg: e.toString()));
    }
  }
}
