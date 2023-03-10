import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OrderResearchModel extends Equatable {
  List<MyOrdersToResearch>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  OrderResearchModel({this.data, this.messages, this.status, this.dataLength});

  OrderResearchModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => MyOrdersToResearch.fromJson(e))
            .toList();
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    }
    if (messages != null) data["messages"] = messages;
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

// ignore: must_be_immutable
class MyOrdersToResearch extends Equatable {
  int? id;
  String? userId;
  int? libraryId;
  int? roomId;
  int? researchStartDateId;
  int? researchEndDateId;
  int? requestTypeId;
  String? responsibleName;
  String? responsibleMobile;
  int? responsibleGradeId;
  dynamic callNum;
  dynamic subjectName;
  String? dateFrom;
  String? dateTo;
  dynamic reasonOfRejection;
  dynamic instructions;
  int? requestStatusId;
  dynamic isArchived;
  String? createdBy;
  String? createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  dynamic room;
  dynamic researchAvailableStartDate;
  dynamic researchAvailableEndDate;
  dynamic researchRequestReply;

  MyOrdersToResearch(
      {this.id,
      this.userId,
      this.libraryId,
      this.roomId,
      this.researchStartDateId,
      this.researchEndDateId,
      this.requestTypeId,
      this.responsibleName,
      this.responsibleMobile,
      this.responsibleGradeId,
      this.callNum,
      this.subjectName,
      this.dateFrom,
      this.dateTo,
      this.reasonOfRejection,
      this.instructions,
      this.requestStatusId,
      this.isArchived,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.room,
      this.researchAvailableStartDate,
      this.researchAvailableEndDate,
      this.researchRequestReply});

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      libraryId,
      roomId,
      researchStartDateId,
      researchEndDateId,
      requestTypeId,
      responsibleName,
      responsibleMobile,
      responsibleGradeId,
      callNum,
      subjectName,
      dateFrom,
      dateTo,
      reasonOfRejection,
      instructions,
      requestStatusId,
      isArchived,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      room,
      researchAvailableStartDate,
      researchAvailableEndDate,
      researchRequestReply,
    ];
  }

  MyOrdersToResearch.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    libraryId = json["libraryId"];
    roomId = json["roomId"];
    researchStartDateId = json["researchStartDateId"];
    researchEndDateId = json["researchEndDateId"];
    requestTypeId = json["requestTypeId"];
    responsibleName = json["responsibleName"];
    responsibleMobile = json["responsibleMobile"];
    responsibleGradeId = json["responsibleGradeId"];
    callNum = json["callNum"];
    subjectName = json["subjectName"];
    dateFrom = json["dateFrom"];
    dateTo = json["dateTo"];
    reasonOfRejection = json["reasonOfRejection"];
    instructions = json["instructions"];
    requestStatusId = json["requestStatusId"];
    isArchived = json["isArchived"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
    room = json["room"];
    researchAvailableStartDate = json["researchAvailableStartDate"];
    researchAvailableEndDate = json["researchAvailableEndDate"];
    researchRequestReply = json["researchRequestReply"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["userId"] = userId;
    data["libraryId"] = libraryId;
    data["roomId"] = roomId;
    data["researchStartDateId"] = researchStartDateId;
    data["researchEndDateId"] = researchEndDateId;
    data["requestTypeId"] = requestTypeId;
    data["responsibleName"] = responsibleName;
    data["responsibleMobile"] = responsibleMobile;
    data["responsibleGradeId"] = responsibleGradeId;
    data["callNum"] = callNum;
    data["subjectName"] = subjectName;
    data["dateFrom"] = dateFrom;
    data["dateTo"] = dateTo;
    data["reasonOfRejection"] = reasonOfRejection;
    data["instructions"] = instructions;
    data["requestStatusId"] = requestStatusId;
    data["isArchived"] = isArchived;
    data["createdBy"] = createdBy;
    data["createdDate"] = createdDate;
    data["updatedBy"] = updatedBy;
    data["updatedDate"] = updatedDate;
    data["room"] = room;
    data["researchAvailableStartDate"] = researchAvailableStartDate;
    data["researchAvailableEndDate"] = researchAvailableEndDate;
    data["researchRequestReply"] = researchRequestReply;
    return data;
  }
}
