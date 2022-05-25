import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FollowOrderVisitModel extends Equatable {
  MyFollowOrder? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  FollowOrderVisitModel(
      {this.data, this.messages, this.status, this.dataLength});

  FollowOrderVisitModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : MyFollowOrder.fromJson(json["data"]);
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) data["data"] = this.data?.toJson();
    if (messages != null) data["messages"] = messages;
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

// ignore: must_be_immutable
class MyFollowOrder extends Equatable {
  int? id;
  String? userId;
  int? libraryId;
  int? visitDateId;
  int? authority;
  String? responsibleName;
  String? responsibleMobile;
  String? responsibleEmail;
  int? numberOfVisitors;
  String? visitReason;
  dynamic? reasonOfRejection;
  dynamic? instructions;
  int? requestStatusId;
  bool? isArchived;
  String? createdBy;
  String? createdDate;
  dynamic? updatedBy;
  String? updatedDate;
  VisitAvailableDate? visitAvailableDate;
  dynamic? visitRequestReply;

  MyFollowOrder(
      {this.id,
      this.userId,
      this.libraryId,
      this.visitDateId,
      this.authority,
      this.responsibleName,
      this.responsibleMobile,
      this.responsibleEmail,
      this.numberOfVisitors,
      this.visitReason,
      this.reasonOfRejection,
      this.instructions,
      this.requestStatusId,
      this.isArchived,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.visitAvailableDate,
      this.visitRequestReply});

  MyFollowOrder.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    libraryId = json["libraryId"];
    visitDateId = json["visitDateId"];
    authority = json["authority"];
    responsibleName = json["responsibleName"];
    responsibleMobile = json["responsibleMobile"];
    responsibleEmail = json["responsibleEmail"];
    numberOfVisitors = json["numberOfVisitors"];
    visitReason = json["visitReason"];
    reasonOfRejection = json["reasonOfRejection"];
    instructions = json["instructions"];
    requestStatusId = json["requestStatusId"];
    isArchived = json["isArchived"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
    visitAvailableDate = json["visitAvailableDate"] == null
        ? null
        : VisitAvailableDate.fromJson(json["visitAvailableDate"]);
    visitRequestReply = json["visitRequestReply"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["userId"] = userId;
    data["libraryId"] = libraryId;
    data["visitDateId"] = visitDateId;
    data["authority"] = authority;
    data["responsibleName"] = responsibleName;
    data["responsibleMobile"] = responsibleMobile;
    data["responsibleEmail"] = responsibleEmail;
    data["numberOfVisitors"] = numberOfVisitors;
    data["visitReason"] = visitReason;
    data["reasonOfRejection"] = reasonOfRejection;
    data["instructions"] = instructions;
    data["requestStatusId"] = requestStatusId;
    data["isArchived"] = isArchived;
    data["createdBy"] = createdBy;
    data["createdDate"] = createdDate;
    data["updatedBy"] = updatedBy;
    data["updatedDate"] = updatedDate;
    if (visitAvailableDate != null)
      data["visitAvailableDate"] = visitAvailableDate?.toJson();
    data["visitRequestReply"] = visitRequestReply;
    return data;
  }

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      libraryId,
      visitDateId,
      authority,
      responsibleName,
      responsibleMobile,
      responsibleEmail,
      numberOfVisitors,
      visitReason,
      reasonOfRejection,
      instructions,
      requestStatusId,
      isArchived,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      visitAvailableDate,
      visitRequestReply
    ];
  }
}

// ignore: must_be_immutable
class VisitAvailableDate extends Equatable {
  int? id;
  int? libraryId;
  int? periodId;
  String? date;
  int? visitStatusId;
  dynamic? visitRequestId;
  String? createdBy;
  String? createdDate;
  dynamic? updatedBy;
  dynamic? updatedDate;

  VisitAvailableDate(
      {this.id,
      this.libraryId,
      this.periodId,
      this.date,
      this.visitStatusId,
      this.visitRequestId,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  VisitAvailableDate.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    libraryId = json["libraryId"];
    periodId = json["periodId"];
    date = json["date"];
    visitStatusId = json["visitStatusId"];
    visitRequestId = json["visitRequestId"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["libraryId"] = libraryId;
    data["periodId"] = periodId;
    data["date"] = date;
    data["visitStatusId"] = visitStatusId;
    data["visitRequestId"] = visitRequestId;
    data["createdBy"] = createdBy;
    data["createdDate"] = createdDate;
    data["updatedBy"] = updatedBy;
    data["updatedDate"] = updatedDate;
    return data;
  }

  @override
  List<Object?> get props {
    return [
      id,
      libraryId,
      periodId,
      date,
      visitStatusId,
      visitRequestId,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate
    ];
  }
}
