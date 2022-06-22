// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AllGradeModel extends Equatable {
  List<AllGrade>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AllGradeModel({this.data, this.messages, this.status, this.dataLength});

  AllGradeModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => AllGrade.fromJson(e)).toList();
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

class AllGrade extends Equatable {
  int? id;
  dynamic key;
  String? value;
  String? valueArabic;
  String? domain;

  AllGrade({this.id, this.key, this.value, this.valueArabic, this.domain});

  AllGrade.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    key = json["key"];
    value = json["value"];
    valueArabic = json["valueArabic"];
    domain = json["domain"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["key"] = key;
    data["value"] = value;
    data["valueArabic"] = valueArabic;
    data["domain"] = domain;
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
