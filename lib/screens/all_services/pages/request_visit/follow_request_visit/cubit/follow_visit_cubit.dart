import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../my_orders/models/model.dart';
import '../models/model.dart';

part 'follow_visit_state.dart';

class FollowVisitCubit extends Cubit<FollowVisitState> {
  final MyOrderToVisit myFollowOrder;
  FollowVisitCubit({required this.myFollowOrder})
      : super(FollowVisitInitial()) {
    getFollowOrderVisit(id: myFollowOrder.id!);
  }

  var userId = Prefs.getString("userId");

  Future<void> getFollowOrderVisit({required int id}) async {
    emit(FollowVisitLoading());
    try {
      final userId = Prefs.getString("userId");
      final res =
          await NetWork.get('VisitRequest/GetVisitRequestById/$id/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(FollowVisitSuccess(
          followOrderVisitModel: FollowOrderVisitModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(FollowVisitError(msg: e.toString()));
    }
  }
}
