import 'package:equatable/equatable.dart';

/// * with queen
/// * with dart only
import 'package:readable/readable.dart';
// ignore: must_be_immutable
class AvailableDatesByRoomModel extends Equatable {
  List<AvailableDatesByRoom>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AvailableDatesByRoomModel(
      {this.data, this.messages, this.status, this.dataLength});

  AvailableDatesByRoomModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => AvailableDatesByRoom.fromJson(e))
            .toList();
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

// ignore: must_be_immutable
class AvailableDatesByRoom extends Equatable {
 final  int id;
 final  int roomId;
 final   DateTime date;
 final  int? researchStatusId;
 final  String? createdBy;
 final   String? createdDate;
 final   dynamic updatedBy;
 final  dynamic updatedDate;

  AvailableDatesByRoom(
      {   required this.id,
        required this.roomId,
        required this.date,
      this.researchStatusId,
        required  this.createdBy,
        required  this.createdDate,
      this.updatedBy,
      this.updatedDate});

 factory AvailableDatesByRoom.fromJson(Map<String, dynamic> json) {
    return AvailableDatesByRoom(
        id : json["id"],
        roomId : json["roomId"] ,
        date : (json["date"] as String).toDate(),
        researchStatusId : json["researchStatusId"],
        createdBy : json["createdBy"],
        createdDate : json["createdDate"],
        updatedBy : json["updatedBy"],
        updatedDate : json["updatedDate"],);


    // id = json["id"];
    // roomId = json["roomId"];
    // date = json["date"];
    // researchStatusId = json["researchStatusId"];
    // createdBy = json["createdBy"];
    // createdDate = json["createdDate"];
    // updatedBy = json["updatedBy"];
    // updatedDate = json["updatedDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["roomId"] = roomId;
    data["date"] = date;
    data["researchStatusId"] = researchStatusId;
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
      roomId,
      date,
      researchStatusId,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}
