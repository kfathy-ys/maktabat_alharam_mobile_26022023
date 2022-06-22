import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/models/model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/update/models/model.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../widgets/date_convertors.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  final OrderModel order;
  UpdateOrderCubit(this.order) : super(UpdateOrderInitial()) {
    if (order.visitorName != null) nameController.text = order.visitorName!;
    if (order.visitorEmail != null) emailController.text = order.visitorEmail!;
    if (order.visitorMobile != null) {
      phoneController.text = order.visitorMobile!;
    }
    if (order.qualifications != null) {
      qualificationController.text = order.qualifications!;
    }
    if (order.suggestedBookTitle != null) {
      addressController.text = order.placeOfPublication!;
    }
    if (order.publisherName != null) {
      namePublisherController.text = order.publisherName!;
    }
    if (order.placeOfPublication != null) {
      placePublisherController.text = order.placeOfPublication!;
    }
    if (order.yearOfPublication != null) {
      yearPublishController.text = order.yearOfPublication!;
    }
    if (order.additionalInformation != null) {
      additionalInfoController.text = order.additionalInformation!;
    }
    if (order.standardBookNumber != null) {
      standardNumberController.text = order.standardBookNumber!;
    }
    if (order.authorName != null) authorNameController.text = order.authorName!;

    if (order.bookTypeId != null) initial = order.bookTypeId!;

    onBookTypeChanged(initial);
  }

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final qualificationController = TextEditingController();
  final addressController = TextEditingController();

  final authorNameController = TextEditingController();

  final namePublisherController = TextEditingController();

  final placePublisherController = TextEditingController();

  final yearPublishController = TextEditingController();

  final standardNumberController = TextEditingController();

  final additionalInfoController = TextEditingController();
  int initial = 0;

  int? typeBookId;
  int onBookTypeChanged(int value) => typeBookId = value;

  var userId = Prefs.getString("userId");

  Future<void> updatedOrderSuggestBook({
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
      var dataNow = DateConverter.dateConverterOnly(now.toString());
      final res = await NetWork.post(
        'Suggestion/UpdateSuggestion',
        body: {
          "id": order.id,
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
        throw res.data["messages"] ?? res.data;
      }
      emit(UpdateOrderSuccess(
          orderUpdateSuggestModel: OrderUpdateSuggestModel.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(UpdateOrderError(e.toString()));
    }
  }
}
