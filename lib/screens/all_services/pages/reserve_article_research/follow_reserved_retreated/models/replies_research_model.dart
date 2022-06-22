import 'package:equatable/equatable.dart';

class RepliesResearchModel extends Equatable {
  List<RepliesResearch>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  RepliesResearchModel(
      {this.data, this.messages, this.status, this.dataLength});

  RepliesResearchModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => RepliesResearch.fromJson(e))
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

class RepliesResearch extends Equatable {
  int? id;
  int? researchRequestId;
  String? userName;
  String? userMessage;
  String? createdBy;
  String? createdDate;
  dynamic updatedBy;
  dynamic updatedDate;

  RepliesResearch(
      {this.id,
      this.researchRequestId,
      this.userName,
      this.userMessage,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  RepliesResearch.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    researchRequestId = json["researchRequestId"];
    userName = json["userName"];
    userMessage = json["userMessage"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["researchRequestId"] = researchRequestId;
    data["userName"] = userName;
    data["userMessage"] = userMessage;
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
      researchRequestId,
      userName,
      userMessage,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}
