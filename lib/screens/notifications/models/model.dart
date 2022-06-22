import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllNotifications extends Equatable {
  List<MyNotifications>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AllNotifications({this.data, this.messages, this.status, this.dataLength});

  AllNotifications.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => MyNotifications.fromJson(e))
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

class MyNotifications extends Equatable {
  int? id;
  dynamic title;
  String? message;
  String? sender;
  String? receiverId;
  String? receiverEmail;
  String? receiverType;
  String? action;
  String? created;
  bool? readed;

  MyNotifications(
      {this.id,
      this.title,
      this.message,
      this.sender,
      this.receiverId,
      this.receiverEmail,
      this.receiverType,
      this.action,
      this.created,
      this.readed});

  MyNotifications.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    message = json["message"];
    sender = json["sender"];
    receiverId = json["receiverId"];
    receiverEmail = json["receiverEmail"];
    receiverType = json["receiverType"];
    action = json["action"];
    created = json["created"];
    readed = json["readed"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["message"] = message;
    data["sender"] = sender;
    data["receiverId"] = receiverId;
    data["receiverEmail"] = receiverEmail;
    data["receiverType"] = receiverType;
    data["action"] = action;
    data["created"] = created;
    data["readed"] = readed;
    return data;
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      message,
      sender,
      receiverId,
      receiverEmail,
      receiverType,
      action,
      created,
      readed,
    ];
  }
}
