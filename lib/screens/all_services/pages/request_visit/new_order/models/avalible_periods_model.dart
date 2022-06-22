import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AvailablePeriodsModel extends Equatable {
  List<AvailablePeriods>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AvailablePeriodsModel(
      {this.data, this.messages, this.status, this.dataLength});

  AvailablePeriodsModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => AvailablePeriods.fromJson(e))
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
  List<Object?> get props {
    return [data, status, messages, dataLength];
  }
}

// ignore: must_be_immutable
class AvailablePeriods extends Equatable {
  int? id;
  String? periodFrom;
  String? periodTo;
  String? periodOfTheDayFrom;
  String? periodOfTheDayFromAr;
  String? periodOfTheDayTo;
  String? periodOfTheDayToAr;
  String? createdBy;
  String? createdDate;
  dynamic updatedBy;
  dynamic updatedDate;

  AvailablePeriods(
      {this.id,
      this.periodFrom,
      this.periodTo,
      this.periodOfTheDayFrom,
      this.periodOfTheDayFromAr,
      this.periodOfTheDayTo,
      this.periodOfTheDayToAr,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  AvailablePeriods.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    periodFrom = json["periodFrom"];
    periodTo = json["periodTo"];
    periodOfTheDayFrom = json["periodOfTheDayFrom"];
    periodOfTheDayFromAr = json["periodOfTheDayFromAr"];
    periodOfTheDayTo = json["periodOfTheDayTo"];
    periodOfTheDayToAr = json["periodOfTheDayToAr"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["periodFrom"] = periodFrom;
    data["periodTo"] = periodTo;
    data["periodOfTheDayFrom"] = periodOfTheDayFrom;
    data["periodOfTheDayFromAr"] = periodOfTheDayFromAr;
    data["periodOfTheDayTo"] = periodOfTheDayTo;
    data["periodOfTheDayToAr"] = periodOfTheDayToAr;
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
      periodFrom,
      periodTo,
      periodOfTheDayFrom,
      periodOfTheDayFromAr,
      periodOfTheDayTo,
      periodOfTheDayToAr,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate
    ];
  }
}
