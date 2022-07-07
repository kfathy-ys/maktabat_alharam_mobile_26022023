import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/new_order/models/all_libraries_model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/all_grads_model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/available_dates_room_model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/room_libraryId_model.dart';
import 'package:maktabat_alharam/screens/widgets/alerts.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:syncfusion_flutter_datepicker/src/date_picker/date_picker_manager.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../../config/enums.dart';
import '../../../../../widgets/date_convertors.dart';
import '../../my_order/models/model.dart';
import '../../my_order/view.dart';

class AvalibleDatesResearchUpdateNotifier extends ChangeNotifier {
 final  MyOrdersToResearch order;

/*  @override
  void notifyListeners() {

    if (order!.callNum != null) {
      callController.text = order!.callNum!.toString();
    }
    if (order!.researchRequestReply != null) {
      reasonController.text = order!.researchRequestReply!;
    }

    if (order!.libraryId != null) selectedLIB = order!.libraryId! as AllLibraries?;
    onLibChang(selectedLIB!);

    if (order!.responsibleGradeId != null) qualificationID = order!.responsibleGradeId! as AllGrade?;
    onQualificationIDChanged(qualificationID!);

    if (order!.requestTypeId != null) authorityID = order!.requestTypeId! ;
    onAuthorityIDChanged(authorityID!);
    super.notifyListeners();
  }*/

  final formKey = GlobalKey<FormState>();

  final callController = TextEditingController();
  final userNameController = TextEditingController();
  final reasonController = TextEditingController();
  final phoneController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();

  ///  ? end of the form

  TypeEntityName? selectedType;
  AllLibraries? selectedLIB;

  AvalibleDatesResearchUpdateNotifier(this.order);

  bool get hasSelectedType => selectedType != null;

  int? authorityID;
  AllGrade? qualificationID;
  MyRoomLibraryId? selectedRoom;
  final rooms = <MyRoomLibraryId>[];
  final dates = <AvailableDatesByRoom>[];

  AvailableDatesByRoom? roomDateAvailableId;

  /// Set List To Store Selected Days From Calender

  CDateRange? selectedDateRange;

  void onLibChang(AllLibraries value) {
    selectedLIB = value;
    if (value.id != null) {
      getAvailableRoomsByLibId(value.id!);
    }
  }

  List<DateTime> get daysToPickFrom => dates.map((e) => e.date).toList();

  void onTypeChanges(TypeEntityName value) {
    selectedType = value;
    selectedRoom = null;
    selectedLIB = null;
    dates.clear();
    daysToPickFrom.clear();

    notifyListeners();
  }

  void onAuthorityIDChanged(int value) => authorityID = value;

  bool isDayAvialable(
      DateTime date,
      ) {
    if (!hasSelectedType) return false;
    if (selectedType!.shouldPickFromAviliableRange) {
      return daysToPickFrom.contains(date);
    }
    return true;
  }

  void onQualificationIDChanged(AllGrade value) => qualificationID = value;

  void checkIfShouldFetchDates() {
    if (selectedLIB != null &&
        selectedRoom != null &&
        selectedRoom?.id != null &&
        selectedType!.shouldPickFromAviliableRange) {
      getAvailableValidDatesByRoomId(selectedRoom!.id!);
    }
  }

  @protected
  Future<void> getAvailableRoomsByLibId(int libId) async {
    try {
      final res = await NetWork.get('Room/GetRoomsByLibraryId/$libId');
      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      rooms.assignAll(
        (res.data['data'] as List).map(
              (e) => MyRoomLibraryId.fromJson(e),
        ),
      );

      notifyListeners();
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      notifyListeners();
    }
  }

  /// Get Available Date In Calender => Then Set DateTime For Reserved
  Future<void> getAvailableValidDatesByRoomId(int roomID) async {
    notifyListeners();
    try {
      dates.clear();
      final res = await NetWork.get(
          'ResearchRequest/GetResearchAvailableDatesByRoomId/$roomID');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }
      dates.assignAll(
        (res.data['data'] as List).map(
              (e) => AvailableDatesByRoom.fromJson(e),
        ),
      );

      notifyListeners();
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      notifyListeners();
    }
  }

  void selectDay(CDateRange dateRange) {
    selectedDateRange = dateRange;
    notifyListeners();
  }

  void selectRoom(MyRoomLibraryId room) {
    selectedRoom = room;

    checkIfShouldFetchDates();
  }

  Future<void> submit() async {
    if (!hasSelectedType) {
      Alert.error("يجب إختيار إسم الخدمة ");
      return;
    }
    if (selectedLIB == null) {
      Alert.error("الرجاء إختيار إسم المكتبة ");
      return;
    }
    if (selectedType!.shouldPickHall && selectedLIB == null) {
      Alert.error('الرجاء إختيار إسم المكتبة ');
      return;
    }
    if (selectedType!.shouldPickHall && selectedRoom == null) {
      Alert.error('الرجاءإختيار القاعة المحددة ');
      return;
    }
    // if (selectedType!.shouldPickFromAviliableRange &&
    //     selectedDateRange == null) {
    //   Alert.error('يجب إخيتارك لفترة البدء والانهاء ');
    //   return;
    // }
    if (qualificationID == null) {
      Alert.error('الرجاء اختيار المؤهل العلمي ');
      return;
    }

    if (formKey.currentState!.validate()) {
      try {
        var now = DateTime.now();
        var dataNow = DateConverter.dateConverterOnly(now.toString());

        userNameController.text = Prefs.getString('fullName');
        phoneController.text = Prefs.getString('phoneNumber');
        final body = <String, Object?>{
          "id": order.id,
          "userId": Prefs.getString('userId'),
          "libraryId": selectedLIB?.id,
          "roomId": selectedType!.shouldPickFromAviliableRange
              ? selectedRoom?.id
              : null,

          "researchStartDateId": selectedType!.shouldPickFromAviliableRange
              ? selectedDateRange?.startId
              : null,
          "researchEndDateId": selectedType!.shouldPickFromAviliableRange
              ? selectedDateRange?.endId
              : null,
          "requestTypeId": selectedType!.toInt(),
          "responsibleName": Prefs.getString('fullName'),
          "responsibleMobile": Prefs.getString('phoneNumber'),
          "responsibleGradeId": qualificationID!.id,
          "callNum": callController.text,
          "subjectName": null,
          //       "dateFrom":selectedType!.shouldPickFromAviliableRange
          // ? dates
          //     .firstWhere((e) => selectedDateRange!.startDate == e.date)
          //     .id
          //     : null,
          //       "dateTo":selectedType!.shouldPickFromAviliableRange
          //           ? dates.firstWhere((e) => selectedDateRange!.endDate == e.date).id
          //           : null,
          "dateFrom": selectedDateRange!.startDate.toString(),
          "dateTo": selectedDateRange!.endDate.toString(),
          "reasonOfRejection": null,
          "instructions": null,
          "requestStatusId": 4,
          "isArchived": false,
          "createdBy": Prefs.getString('userId'),
          "createdDate": dataNow,
          "updatedBy": Prefs.getString('userId'),
          "updatedDate": dataNow
        };
        final res = await NetWork.post(
            'ResearchRequest/UpdateResearchRequest',
            body: body);
        if (res.statusCode == 500) {
          throw "Errorrrrrrrrrrrrrrrrrrr 500 ";

          // throw   (res.data ["messages"][0]["body"]).toString();
          //     log(res.data["messages"][0]["body"]);
        }
        if (res.data['status'] == 0 || res.data['status'] == -1) {
          throw res.data['messages'];
        }
        Alert.success("تم تعديل طلبك بنجاح ");
        notifyListeners();
      } catch (e, st) {
        log(e.toString());
        log(st.toString());
        notifyListeners();
      }
      Alert.success("تم تعديل طلبك بنجاح ");
      Get.off(() => const MyOrderReserveArticleResearch());
    } else {
      Alert.error("الرجاء التاكيد من الطلب ");
    }
  }

  void onRageChanges(DateTimeRange range) {
    late int id1, id2;

    for (final date in dates) {
      if (date.date == range.start) {
        id1 = date.id;
      }
      if (date.date == range.end) {
        id2 = date.id;
      }
    }
    selectedDateRange = CDateRange(
      id1,
      id2,
      startDate: range.start,
      endDate: range.end,
    );

    log('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' + range.toString());
  }
}

class CDateRange {
  final DateTime startDate;
  final DateTime endDate;
  final int startId;
  final int endId;

  CDateRange(this.startId, this.endId,
      {required this.startDate, required this.endDate});
}
