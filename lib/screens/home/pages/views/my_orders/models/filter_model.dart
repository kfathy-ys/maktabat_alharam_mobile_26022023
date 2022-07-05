// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class FiltersModel extends Equatable {
  List<MyFilters>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  FiltersModel({this.data, this.messages, this.status, this.dataLength});

  FiltersModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => MyFilters.fromJson(e)).toList();
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
  List<Object?> get props => [data, dataLength, messages, status];
}

class MyFilters extends Equatable {
  int? id;
  int? code;
  String? type;
  String? requestNameAr;
  String? requestNameEn;
  String? date;
  String? statusAr;
  String? statusEn;
  bool? isEditable;

  MyFilters(
      {this.id,
      this.code,
      this.type,
      this.requestNameAr,
      this.requestNameEn,
      this.date,
      this.statusAr,
      this.statusEn,
      this.isEditable});

  MyFilters.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    code = json["code"];
    type = json["type"];
    requestNameAr = json["requestNameAr"];
    requestNameEn = json["requestNameEn"];
    date = json["date"];
    statusAr = json["statusAr"];
    statusEn = json["statusEn"];
    isEditable = json["isEditable"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["code"] = code;
    data["type"] = type;
    data["requestNameAr"] = requestNameAr;
    data["requestNameEn"] = requestNameEn;
    data["date"] = date;
    data["statusAr"] = statusAr;
    data["statusEn"] = statusEn;
    data["isEditable"] = isEditable;
    return data;
  }

  @override
  List<Object?> get props {
    return [
      id,
      code,
      type,
      requestNameAr,
      requestNameEn,
      date,
      statusAr,
      statusEn,
      isEditable,
    ];
  }
}
