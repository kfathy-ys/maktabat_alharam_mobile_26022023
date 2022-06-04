import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/screens/widgets/alerts.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';

import '../models/replies_model.dart';
import 'package:flutter/material.dart';

part 'replies_state.dart';

class RepliesCubit extends Cubit<RepliesState> {
   int? id;
  final formKey = GlobalKey<FormState>();
  final addCommentController = TextEditingController();
  static RepliesCubit of(context)=>BlocProvider.of(context);
      RepliesCubit() : super(RepliesInitial()) ;
  //     {
  //   getFollowRepliesVisit(visitRequestId: id!);
  // }

  var userId = Prefs.getString("userId");


  void init ( int id){
    this.id=id;
    getFollowRepliesVisit();
  }

  Future<void> getFollowRepliesVisit() async {
    emit(RepliesLoading());
    try {
      // final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'VisitRequest/GetAllVisitRequestReplies/$id');

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

  Future<void> addedCommentToFollowVisit({

    required int visitRequestId,
    required String userName,
    required String userMessage,
  }) async {
    try {
      var now = DateTime.now();
      final body = {
        "id": 0,
        "visitRequestId": visitRequestId,
        "userName": userName,
        "userMessage": userMessage,
        "createdBy": userId,
        "createdDate": DateFormat('yyyy-MM-dd').format(now),
        "updatedBy": userId,
        "updatedDate": DateFormat('yyyy-MM-dd').format(now)
      };
      final res = await NetWork.post('VisitRequest/CreateNewVisitRequestReply',
          body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      /// Cached createdBy
      Prefs.setString("createdBy", res.data["data"][4]["createdBy"]);
      log("${res.data["data"][4]["createdBy"]}");
      emit(RepliesSuccess(
          repliesMessagesModel: RepliesMessagesModel.fromJson(res.data)));
      await getFollowRepliesVisit();
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(RepliesError(msg: e.toString()));
    }
  }

  Future<void> addToCommentVisit(RepliesMessage order) async {
    if( addCommentController.text.trim().isEmpty){
      Alert.error("error");
    }
    await addedCommentToFollowVisit(

      visitRequestId: order.visitRequestId!,
      userName: order.userName.toString(),
      userMessage: order.userMessage.toString(),
    );
    await getFollowRepliesVisit();
    Alert.success(" الرجاء انتظار رد الموظف المختص");
  }
}
