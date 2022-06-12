import 'package:equatable/equatable.dart';

class FollowResearchModel extends Equatable {
  MyFollowResearch? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  FollowResearchModel({this.data, this.messages, this.status, this.dataLength});

  FollowResearchModel.fromJson(Map<String, dynamic> json) {
    data =
        json["data"] == null ? null : MyFollowResearch.fromJson(json["data"]);
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

class MyFollowResearch extends Equatable {
  int? id;
  String? userId;
  int? libraryId;
  int? roomId;
  dynamic? researchStartDateId;
  dynamic? researchEndDateId;
  int? requestTypeId;
  String? responsibleName;
  String? responsibleMobile;
  int? responsibleGradeId;
  String? callNum;
  dynamic? subjectName;
  String? dateFrom;
  String? dateTo;
  dynamic? reasonOfRejection;
  dynamic? instructions;
  int? requestStatusId;
  bool? isArchived;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  Room? room;
  dynamic? researchAvailableStartDate;
  dynamic? researchAvailableEndDate;
  dynamic? researchRequestReply;

  MyFollowResearch(
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

  MyFollowResearch.fromJson(Map<String, dynamic> json) {
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
    room = json["room"] == null ? null : Room.fromJson(json["room"]);
    researchAvailableStartDate = json["researchAvailableStartDate"];
    researchAvailableEndDate = json["researchAvailableEndDate"];
    researchRequestReply = json["researchRequestReply"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (room != null) data["room"] = room?.toJson();
    data["researchAvailableStartDate"] = researchAvailableStartDate;
    data["researchAvailableEndDate"] = researchAvailableEndDate;
    data["researchRequestReply"] = researchRequestReply;
    return data;
  }

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
}

class Room extends Equatable {
  int? id;
  int? libraryId;
  String? nameAr;
  String? nameEn;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  Room(
      {this.id,
      this.libraryId,
      this.nameAr,
      this.nameEn,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  Room.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    libraryId = json["libraryId"];
    nameAr = json["nameAr"];
    nameEn = json["nameEn"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["libraryId"] = libraryId;
    data["nameAr"] = nameAr;
    data["nameEn"] = nameEn;
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
      nameAr,
      nameEn,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}
