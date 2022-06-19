// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class RoomLibraryIdModel extends Equatable {
  List<MyRoomLibraryId>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  RoomLibraryIdModel({this.data, this.messages, this.status, this.dataLength});

  RoomLibraryIdModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => MyRoomLibraryId.fromJson(e))
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
  List<Object?> get props => [data, status, messages, dataLength];
}

class MyRoomLibraryId extends Equatable {
  int? id;
  int? libraryId;
  String? nameAr;
  String? nameEn;
  String? createdBy;
  String? createdDate;
  dynamic? updatedBy;
  dynamic? updatedDate;

  MyRoomLibraryId(
      {this.id,
      this.libraryId,
      this.nameAr,
      this.nameEn,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  MyRoomLibraryId.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    libraryId = json["libraryId"];
    nameAr = json["nameAr"];
    nameEn = json["nameEn"];
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    updatedBy = json["updatedBy"];
    updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["libraryId"] = libraryId;
    data["nameAr"] = nameAr;
    data["nameEn"] = nameEn;
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
      nameAr,
      nameEn,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}