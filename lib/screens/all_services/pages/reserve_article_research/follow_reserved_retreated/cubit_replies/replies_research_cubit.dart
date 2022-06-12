import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/widgets/date_convertors.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/alerts.dart';
import '../models/replies_research_model.dart';

part 'replies_research_state.dart';

class RepliesResearchCubit extends Cubit<RepliesResearchState> {
  int? id;
  final formKey = GlobalKey<FormState>();
  final addCommentController = TextEditingController();

  static RepliesResearchCubit of(context) => BlocProvider.of(context);

  RepliesResearchCubit() : super(RepliesResearchInitial());

  var userId = Prefs.getString("userId");

  void init(int id) {
    this.id = id;
    getFollowRepliesResearch();
  }

  Future<void> getFollowRepliesResearch() async {
    emit(RepliesResearchLoading());
    try {
      final res =
          await NetWork.get('ResearchRequest/GetAllResearchRequestReplies/$id');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(RepliesResearchSuccess(
          repliesResearchModel: RepliesResearchModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(RepliesResearchError(msg: e.toString()));
    }
  }

  Future<void> addedCommentToFollowResearch({
    required int researchRequestId,
    required String userName,
    required String userMessage,
  }) async {
    try {
      var now = DateTime.now();
      final body = {
        "id": 0,
        "researchRequestId": researchRequestId,
        "userName": userName,
        "userMessage": userMessage,
        "createdBy": userId,
        "createdDate": DateConverter.dateConverterMonth(now.toString()),
        "updatedBy": null,
        "updatedDate": null
      };
      final res = await NetWork.post(
          'ResearchRequest/CreateNewResearchRequestReply',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(RepliesResearchSuccess(
          repliesResearchModel: RepliesResearchModel.fromJson(res.data)));
      await getFollowRepliesResearch();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(RepliesResearchError(msg: e.toString()));
    }
  }

  Future<void> addToCommentResearch(RepliesResearch order) async {
    if (addCommentController.text.trim().isEmpty) {
      Alert.error("error");
    }
    await addedCommentToFollowResearch(
      researchRequestId: order.researchRequestId!,
      userName: order.userName.toString(),
      userMessage: order.userMessage.toString(),
    );
    await getFollowRepliesResearch();
    Alert.success(" الرجاء انتظار رد الموظف المختص");
  }
}
