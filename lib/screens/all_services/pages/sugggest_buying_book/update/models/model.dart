
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OrderUpdateSuggestModel extends Equatable{
  List<Data>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  OrderUpdateSuggestModel({this.data, this.messages, this.status, this.dataLength});

  OrderUpdateSuggestModel.fromJson(Map<String, dynamic> json) {
    data = json["data"]==null ? null : (json["data"] as List).map((e)=>Data.fromJson(e)).toList();
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.data != null)
      data["data"] = this.data?.map((e)=>e.toJson()).toList();
    if(messages != null)
      data["messages"] = messages;
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override

  List<Object?> get props => [data, messages ,status,dataLength];
}

class Data extends Equatable{
  int? id;
  String? visitorName;
  String? visitorEmail;
  String? visitorMobile;
  String? qualifications;
  String? suggestedBookTitle;
  String? authorName;
  String? publisherName;
  String? placeOfPublication;
  String? yearOfPublication;
  String? standardBookNumber;
  int? bookTypeId;
  String? additionalInformation;
  bool? isArchived;
  String? createdBy;
  String? createdDate;
  dynamic? updatedBy;
  dynamic? updatedDate;

  Data({this.id, this.visitorName, this.visitorEmail, this.visitorMobile, this.qualifications, this.suggestedBookTitle, this.authorName, this.publisherName, this.placeOfPublication, this.yearOfPublication, this.standardBookNumber, this.bookTypeId, this.additionalInformation, this.isArchived, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    visitorName = json["visitorName"];
    visitorEmail = json["visitorEmail"];
    visitorMobile = json["visitorMobile"];
    qualifications = json["qualifications"];
    suggestedBookTitle = json["suggestedBookTitle"];
    authorName = json["authorName"];
    publisherName = json["publisherName"];
    placeOfPublication = json["placeOfPublication"];
    yearOfPublication = json["yearOfPublication"];
    standardBookNumber = json["standardBookNumber"];
    bookTypeId = json["bookTypeId"];
    additionalInformation = json["additionalInformation"];
    isArchived = json["isArchived"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["visitorName"] = visitorName;
    data["visitorEmail"] = visitorEmail;
    data["visitorMobile"] = visitorMobile;
    data["qualifications"] = qualifications;
    data["suggestedBookTitle"] = suggestedBookTitle;
    data["authorName"] = authorName;
    data["publisherName"] = publisherName;
    data["placeOfPublication"] = placeOfPublication;
    data["yearOfPublication"] = yearOfPublication;
    data["standardBookNumber"] = standardBookNumber;
    data["bookTypeId"] = bookTypeId;
    data["additionalInformation"] = additionalInformation;
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
      visitorName,
      visitorEmail,
      visitorMobile,
      qualifications,
      suggestedBookTitle,
      authorName,
      publisherName,
      placeOfPublication,
      yearOfPublication,
      standardBookNumber,
      bookTypeId,
      additionalInformation,
      isArchived,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}