import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/new_order/models/model.dart';
import 'package:maktabat_alharam/screens/widgets/date_convertors.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit() : super(NewOrderInitial());

  CreateOrderModel? createOrderModel;
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
    emit(NewOrderLoading());
    try {
      var now = DateTime.now();
    var dataNow=  DateConverter.dateConverterOnly(now.toString());

      final res = await NetWork.post(
        'Suggestion/CreateNewSuggestion',
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
          "createdDate": dataNow,
          "updatedBy": userId,
          "updatedDate": dataNow
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      // Prefs.setString("userId", res.data["data"]["userId"]);
      // log("${res.data["data"]["fullName"]}");
      emit(NewOrderSuccess(
          createOrderModel: CreateOrderModel.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(NewOrderError(msg: e.toString()));
    }
  }
}
