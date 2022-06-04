// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:readable/readable.dart';

class AvailableDatesModel extends Equatable {
  List<AvailableDates>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AvailableDatesModel({this.data, this.messages, this.status, this.dataLength});

  AvailableDatesModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => AvailableDates.fromJson(e))
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

class AvailableDates extends Equatable {
  final int id;
  final int libraryId;
  final int periodId;
  final DateTime date;
  final int visitStatusId;
  final int? visitRequestId;
  final String createdBy;
  final String createdDate;
  final String? updatedBy;
  final String? updatedDate;

  const AvailableDates({
    required this.id,
    required this.libraryId,
    required this.periodId,
    required this.date,
    required this.visitStatusId,
    this.visitRequestId,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory AvailableDates.fromJson(Map<String, dynamic> json) {
    // id = json["id"];
    // libraryId = json["libraryId"];
    // periodId = json["periodId"];
    // date = json["date"];
    // visitStatusId = json["visitStatusId"];
    // visitRequestId = json["visitRequestId"];
    // createdBy = json["createdBy"];
    // createdDate = json["createdDate"];
    // updatedBy = json["updatedBy"];
    // updatedDate = json["updatedDate"];

    return AvailableDates(
      id: json["id"],
      libraryId: json["libraryId"],
      periodId: json["periodId"],
      date: (json["date"] as String).toDate(),
      visitStatusId: json["visitStatusId"],
      createdBy: json["createdBy"],
      createdDate: json["createdDate"],
      visitRequestId: json["visitRequestId"],
      updatedBy: json["updatedBy"],
      updatedDate: json["updatedDate"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["libraryId"] = libraryId;
    data["periodId"] = periodId;
    data["date"] = date;
    data["visitStatusId"] = visitStatusId;
    data["visitRequestId"] = visitRequestId;
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
      libraryId,
      periodId,
      date,
      visitStatusId,
      visitRequestId,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}
