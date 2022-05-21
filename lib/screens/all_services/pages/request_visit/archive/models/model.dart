// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ArchiveVisitModel extends Equatable {
  List<MyArchiveVisits>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  ArchiveVisitModel({this.data, this.messages, this.status, this.dataLength});

  ArchiveVisitModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => MyArchiveVisits.fromJson(e))
            .toList();
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    if (messages != null) data["messages"] = messages;
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

class MyArchiveVisits extends Equatable {
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
  String? updatedBy;
  String? updatedDate;
  dynamic? visitAvailableDate;
  dynamic? visitRequestReply;

  MyArchiveVisits(
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

  MyArchiveVisits.fromJson(Map<String, dynamic> json) {
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
    visitAvailableDate = json["visitAvailableDate"];
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
    data["visitAvailableDate"] = visitAvailableDate;
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
      visitRequestReply,
    ];
  }
}
