
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllAskFollowModel extends Equatable{
  FollowAskOrder? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AllAskFollowModel({this.data, this.messages, this.status, this.dataLength});

  AllAskFollowModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : FollowAskOrder.fromJson(json["data"]);
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.data != null)
      data["data"] = this.data?.toJson();
    if(messages != null)
      data["messages"] = messages;
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override

  List<Object?> get props => [data,messages,status,dataLength];
}

// ignore: must_be_immutable
class FollowAskOrder extends Equatable{
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

  FollowAskOrder({this.id, this.type, this.visitorName, this.visitorEmail, this.visitorMobile, this.visitorMessage, this.response, this.isArchived, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate});

  FollowAskOrder.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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