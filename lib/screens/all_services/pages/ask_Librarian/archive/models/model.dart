// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AskArchivedModel extends Equatable {
  List<AskArchiveData>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AskArchivedModel({this.data, this.messages, this.status, this.dataLength});

  AskArchivedModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => AskArchiveData.fromJson(e))
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
    if (messages != null) {
      data["messages"] = messages;
    }
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

class AskArchiveData extends Equatable {
  int? id;
  int? type;
  String? visitorName;
  String? visitorEmail;
  String? visitorMobile;
  String? visitorMessage;
  String? response;
  bool? isArchived;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  AskArchiveData(
      {this.id,
      this.type,
      this.visitorName,
      this.visitorEmail,
      this.visitorMobile,
      this.visitorMessage,
      this.response,
      this.isArchived,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  AskArchiveData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    visitorName = json["visitorName"];
    visitorEmail = json["visitorEmail"];
    visitorMobile = json["visitorMobile"];
    visitorMessage = json["visitorMessage"];
    response = json["response"];
    isArchived = json["isArchived"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["type"] = type;
    data["visitorName"] = visitorName;
    data["visitorEmail"] = visitorEmail;
    data["visitorMobile"] = visitorMobile;
    data["visitorMessage"] = visitorMessage;
    data["response"] = response;
    data["isArchived"] = isArchived;
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
      type,
      visitorName,
      visitorEmail,
      visitorMobile,
      visitorMessage,
      response,
      isArchived,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}
