// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ArchivedThesisModel extends Equatable {
  List<MyArchivedThesis>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  ArchivedThesisModel({this.data, this.messages, this.status, this.dataLength});

  ArchivedThesisModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => MyArchivedThesis.fromJson(e))
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
  List<Object?> get props => [data, dataLength, status, messages];
}

class MyArchivedThesis extends Equatable {
  int? id;
  String? userId;
  String? applicantName;
  int? universityId;
  String? faculty;
  String? department;
  String? mobile;
  String? email;
  String? thesisData;
  String? thesisTitle;
  String? scientificDegree;
  String? yearOfDiscussion;
  int? numberOfPages;
  int? numberOfParts;
  bool? isAvailable;
  bool? isAvailableWithChains;
  int? availabilityType;
  String? thesisFile;
  dynamic thesisTitleFile;
  dynamic subjectsIndexFile;
  dynamic arabicExtractFile;
  dynamic englishExtractFile;
  dynamic introFile;
  dynamic collectionFile;
  dynamic quarterCollectionFile;
  dynamic callNum;
  int? requestStatusId;
  bool? isArchived;
  dynamic reasonOfRejection;
  dynamic instructions;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  dynamic thesisDepositionRequestReply;

  MyArchivedThesis({
    this.id,
    this.userId,
    this.applicantName,
    this.universityId,
    this.faculty,
    this.department,
    this.mobile,
    this.email,
    this.thesisData,
    this.thesisTitle,
    this.scientificDegree,
    this.yearOfDiscussion,
    this.numberOfPages,
    this.numberOfParts,
    this.isAvailable,
    this.isAvailableWithChains,
    this.availabilityType,
    this.thesisFile,
    this.thesisTitleFile,
    this.subjectsIndexFile,
    this.arabicExtractFile,
    this.englishExtractFile,
    this.introFile,
    this.collectionFile,
    this.quarterCollectionFile,
    this.callNum,
    this.requestStatusId,
    this.isArchived,
    this.reasonOfRejection,
    this.instructions,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.thesisDepositionRequestReply,
  });

  MyArchivedThesis.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    applicantName = json["applicantName"];
    universityId = json["universityId"];
    faculty = json["faculty"];
    department = json["department"];
    mobile = json["mobile"];
    email = json["email"];
    thesisData = json["thesisData"];
    thesisTitle = json["thesisTitle"];
    scientificDegree = json["scientificDegree"];
    yearOfDiscussion = json["yearOfDiscussion"];
    numberOfPages = json["numberOfPages"];
    numberOfParts = json["numberOfParts"];
    isAvailable = json["isAvailable"];
    isAvailableWithChains = json["isAvailableWithChains"];
    availabilityType = json["availabilityType"];
    thesisFile = json["thesisFile"];
    thesisTitleFile = json["thesisTitleFile"];
    subjectsIndexFile = json["subjectsIndexFile"];
    arabicExtractFile = json["arabicExtractFile"];
    englishExtractFile = json["englishExtractFile"];
    introFile = json["introFile"];
    collectionFile = json["collectionFile"];
    quarterCollectionFile = json["quarterCollectionFile"];
    callNum = json["callNum"];
    requestStatusId = json["requestStatusId"];
    isArchived = json["isArchived"];
    reasonOfRejection = json["reasonOfRejection"];
    instructions = json["instructions"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
    thesisDepositionRequestReply = json["thesisDepositionRequestReply"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["userId"] = userId;
    data["applicantName"] = applicantName;
    data["universityId"] = universityId;
    data["faculty"] = faculty;
    data["department"] = department;
    data["mobile"] = mobile;
    data["email"] = email;
    data["thesisData"] = thesisData;
    data["thesisTitle"] = thesisTitle;
    data["scientificDegree"] = scientificDegree;
    data["yearOfDiscussion"] = yearOfDiscussion;
    data["numberOfPages"] = numberOfPages;
    data["numberOfParts"] = numberOfParts;
    data["isAvailable"] = isAvailable;
    data["isAvailableWithChains"] = isAvailableWithChains;
    data["availabilityType"] = availabilityType;
    data["thesisFile"] = thesisFile;
    data["thesisTitleFile"] = thesisTitleFile;
    data["subjectsIndexFile"] = subjectsIndexFile;
    data["arabicExtractFile"] = arabicExtractFile;
    data["englishExtractFile"] = englishExtractFile;
    data["introFile"] = introFile;
    data["collectionFile"] = collectionFile;
    data["quarterCollectionFile"] = quarterCollectionFile;
    data["callNum"] = callNum;
    data["requestStatusId"] = requestStatusId;
    data["isArchived"] = isArchived;
    data["reasonOfRejection"] = reasonOfRejection;
    data["instructions"] = instructions;
    data["createdBy"] = createdBy;
    data["createdDate"] = createdDate;
    data["updatedBy"] = updatedBy;
    data["updatedDate"] = updatedDate;
    data["thesisDepositionRequestReply"] = thesisDepositionRequestReply;
    return data;
  }

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      applicantName,
      universityId,
      faculty,
      department,
      mobile,
      email,
      thesisData,
      thesisTitle,
      scientificDegree,
      yearOfDiscussion,
      numberOfPages,
      numberOfParts,
      isAvailable,
      isAvailableWithChains,
      availabilityType,
      thesisFile,
      thesisTitleFile,
      subjectsIndexFile,
      arabicExtractFile,
      englishExtractFile,
      introFile,
      collectionFile,
      quarterCollectionFile,
      callNum,
      requestStatusId,
      isArchived,
      reasonOfRejection,
      instructions,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      thesisDepositionRequestReply,
    ];
  }
}
