import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RepliesMessagesModel extends Equatable {
  List<RepliesMessage>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  RepliesMessagesModel(
      {this.data, this.messages, this.status, this.dataLength});

  RepliesMessagesModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => RepliesMessage.fromJson(e))
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

// ignore: must_be_immutable
class RepliesMessage extends Equatable {
  int? id;
  int? visitRequestId;
  String? userName;
  String? userMessage;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  RepliesMessage(
      {this.id,
      this.visitRequestId,
      this.userName,
      this.userMessage,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  RepliesMessage.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    visitRequestId = json["visitRequestId"];
    userName = json["userName"];
    userMessage = json["userMessage"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["visitRequestId"] = visitRequestId;
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
      visitRequestId,
      userName,
      userMessage,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate
    ];
  }
}
