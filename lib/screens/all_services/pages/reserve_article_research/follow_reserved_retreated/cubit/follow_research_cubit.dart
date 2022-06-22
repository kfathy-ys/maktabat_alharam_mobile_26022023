import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../my_order/models/model.dart';
import '../models/model.dart';

part 'follow_research_state.dart';

class FollowResearchCubit extends Cubit<FollowResearchState> {
  final MyOrdersToResearch myOrdersToResearch;
  FollowResearchCubit({required this.myOrdersToResearch})
      : super(FollowResearchInitial()) {
    getFollowOrderResearch(id: myOrdersToResearch.id!);
  }

  var userId = Prefs.getString("userId");

  Future<void> getFollowOrderResearch({required int id}) async {
    emit(FollowResearchLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'ResearchRequest/GetResearchRequestById/$id/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(FollowResearchSuccess(
          followResearchModel: FollowResearchModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(FollowResearchError(msg: e.toString()));
    }
  }
}
