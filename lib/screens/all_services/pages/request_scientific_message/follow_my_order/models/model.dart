import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllRepliesThesisModel extends Equatable {
  List<MyRepliesThesis>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AllRepliesThesisModel(
      {this.data, this.messages, this.status, this.dataLength});

  AllRepliesThesisModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => MyRepliesThesis.fromJson(e))
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

// ignore: must_be_immutable
class MyRepliesThesis extends Equatable {
  int? id;
  int? thesisDepositionRequestId;
  String? userName;
  String? userMessage;
  String? createdBy;
  String? createdDate;
  dynamic updatedBy;
  dynamic updatedDate;

  MyRepliesThesis(
      {this.id,
      this.thesisDepositionRequestId,
      this.userName,
      this.userMessage,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  MyRepliesThesis.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    thesisDepositionRequestId = json["thesisDepositionRequestId"];
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
    data["thesisDepositionRequestId"] = thesisDepositionRequestId;
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
      thesisDepositionRequestId,
      userName,
      userMessage,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}
