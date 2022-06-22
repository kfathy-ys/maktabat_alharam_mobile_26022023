import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllRoomModel extends Equatable {
  List<AllRooms>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AllRoomModel({this.data, this.messages, this.status, this.dataLength});

  AllRoomModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => AllRooms.fromJson(e)).toList();
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
class AllRooms extends Equatable {
  int? id;
  int? libraryId;
  String? nameAr;
  String? nameEn;
  String? createdBy;
  String? createdDate;
  dynamic updatedBy;
  dynamic updatedDate;

  AllRooms(
      {this.id,
      this.libraryId,
      this.nameAr,
      this.nameEn,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  AllRooms.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
      updatedDate
    ];
  }
}
