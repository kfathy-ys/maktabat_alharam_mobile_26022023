import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/alerts.dart';
import '../../../../../widgets/date_convertors.dart';
import '../models/model.dart';

part 'thesis_replies_state.dart';

class ThesisRepliesCubit extends Cubit<ThesisRepliesState> {
  ThesisRepliesCubit() : super(ThesisRepliesInitial());

  int? id;
  final formKey = GlobalKey<FormState>();
  final addCommentController = TextEditingController();

  static ThesisRepliesCubit of(context) => BlocProvider.of(context);
  var userId = Prefs.getString("userId");

  void init(int id) {
    this.id = id;
    getFollowRepliesThesis();
  }

  Future<void> getFollowRepliesThesis() async {
    emit(ThesisRepliesLoading());
    try {
      final res = await NetWork.get(
          'ThesisDepositionRequest/GetAllThesisDepositionRequestReplies/$id');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(ThesisRepliesSuccess(
          allRepliesThesisModel: AllRepliesThesisModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(ThesisRepliesError(msg: e.toString()));
    }
  }

  Future<void> addedCommentToFollowThesis({
    required int thesisDepositionRequestId,
    required String userName,
    required String userMessage,
  }) async {
    try {
      var now = DateTime.now();
      final body = {
        "id": 0,
        "thesisDepositionRequestId": thesisDepositionRequestId,
        "userName": userName,
        "userMessage": userMessage,
        "createdBy": userId,
        "createdDate": DateConverter.dateConverterMonth(now.toString()),
        "updatedBy": null,
        "updatedDate": null
      };
      final res = await NetWork.post(
          'ThesisDepositionRequest/CreateNewThesisDepositionRequestReply',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(ThesisRepliesSuccess(
          allRepliesThesisModel: AllRepliesThesisModel.fromJson(res.data)));
      await getFollowRepliesThesis();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ThesisRepliesError(msg: e.toString()));
    }
  }

  Future<void> addToCommentThesis(MyRepliesThesis order) async {
    if (addCommentController.text.trim().isEmpty) {
      Alert.error("error");
    }
    await addedCommentToFollowThesis(
      thesisDepositionRequestId: order.thesisDepositionRequestId!,
      userName: order.userName.toString(),
      userMessage: order.userMessage.toString(),
    );
    await getFollowRepliesThesis();
    Alert.success(" الرجاء انتظار رد الموظف المختص");
  }
}
