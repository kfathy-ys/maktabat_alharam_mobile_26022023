import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../message_files/cubit/messages_input.dart';

part 'new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit() : super(NewOrderInitial());
  Future<void> sendMessagesResearchData({  MessagesFilesInputData? filesInputData}) async {
    emit(NewOrderLoading());
    try {
      final res = await NetWork.post('ThesisDepositionRequest/CreateOrUpdateThesisDepositionRequestWithAttach',
          body: FormData.fromMap({

           "jsonString":filesInputData!.toJson().toString(),

          })
      //     {
      //
      //  // "jsonString": json.encode(filesInputData!.toJson()),
      //   "jsonString": FormData.fromMap(filesInputData!.toJson()),
      //
      // }

      );
      log(res.data.toString());
      if (res.statusCode == 200) {

        emit(NewOrderSuccess());
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(NewOrderError(msg: e.toString()));
    }
  }
}
