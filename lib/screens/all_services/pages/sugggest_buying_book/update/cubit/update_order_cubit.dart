import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/update/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit() : super(UpdateOrderInitial());

  OrderUpdateSuggestModel? orderUpdateSuggestModel;
  int? typeBookId;
  int onBookTypeChanged(int value)=> typeBookId= value;

  var userId = Prefs.getString("userId");

  Future<void> createOrderSuggestBook({
    required String visitorName,
    required String visitorEmail,
    required String visitorMobile,
    required String qualifications,
    required String bookTitle,
    required String authorName,
    required String publisherName,
    required String placeOfPublication,
    required String yearOfPublication,
    required String standardBookNumber,
    required String additionalInformation,
  }) async {
    emit(UpdateOrderLoading());
    try {
      var now = DateTime.now();
      final res = await NetWork.post(
        '/Suggestion/UpdateSuggestion',
        body: {
          "id": 0,
          "visitorName": visitorName,
          "visitorEmail": visitorEmail,
          "visitorMobile": visitorMobile,
          "qualifications": qualifications,
          "suggestedBookTitle": bookTitle,
          "authorName": authorName,
          "publisherName": publisherName,
          "placeOfPublication": placeOfPublication,
          "yearOfPublication": yearOfPublication,
          "standardBookNumber": standardBookNumber,
          "bookTypeId": typeBookId,
          "additionalInformation": additionalInformation,
          "isArchived": false,
          "createdBy": userId,
          "createdDate": DateFormat('yyyy-MM-dd').format(now),
          "updatedBy": userId,
          "updatedDate": DateFormat('yyyy-MM-dd').format(now)
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(UpdateOrderSuccess(
            orderUpdateSuggestModel: OrderUpdateSuggestModel.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(UpdateOrderError(msg: e.toString()));
    }
  }
}
