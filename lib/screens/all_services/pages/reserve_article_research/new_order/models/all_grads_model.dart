// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AllGradeModel extends Equatable {
  List<AllGrade>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AllGradeModel({this.data, this.messages, this.status, this.dataLength});

  AllGradeModel.fromJson(Map<String, dynamic> json) {
    this.data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => AllGrade.fromJson(e)).toList();
    this.messages = json["messages"] ?? [];
    this.status = json["status"];
    this.dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    if (this.messages != null) data["messages"] = this.messages;
    data["status"] = this.status;
    data["dataLength"] = this.dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

class AllGrade extends Equatable {
  int? id;
  dynamic? key;
  String? value;
  String? valueArabic;
  String? domain;

  AllGrade({this.id, this.key, this.value, this.valueArabic, this.domain});

  AllGrade.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.key = json["key"];
    this.value = json["value"];
    this.valueArabic = json["valueArabic"];
    this.domain = json["domain"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["key"] = this.key;
    data["value"] = this.value;
    data["valueArabic"] = this.valueArabic;
    data["domain"] = this.domain;
    return data;
  }

  @override
  List<Object?> get props {
    return [
      id,
      key,
      value,
      valueArabic,
      domain,
    ];
  }
}
