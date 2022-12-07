import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllUniversityModel extends Equatable {
  List<AllUni>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  AllUniversityModel({this.data, this.messages, this.status, this.dataLength});

  AllUniversityModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => AllUni.fromJson(e)).toList();
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
  // TODO: implement props
  List<Object?> get props => [data, dataLength, messages, status];
}

class AllUni extends Equatable {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdBy;
  String? createdDate;
  dynamic? updatedBy;
  dynamic? updatedDate;

  AllUni(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate});

  AllUni.fromJson(Map<String, dynamic> json) {
    id = json["id"];
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
    data["nameAr"] = nameAr;
    data["nameEn"] = nameEn;
    data["createdBy"] = createdBy;
    data["createdDate"] = createdDate;
    data["updatedBy"] = updatedBy;
    data["updatedDate"] = updatedDate;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      nameAr,
      nameEn,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
    ];
  }
}
