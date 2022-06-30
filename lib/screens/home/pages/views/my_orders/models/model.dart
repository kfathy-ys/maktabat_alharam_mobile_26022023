
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OrdersModel extends Equatable{
  List<AllMyOrders>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  OrdersModel({this.data, this.messages, this.status, this.dataLength});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    data = json["data"]==null ? null : (json["data"] as List).map((e)=>AllMyOrders.fromJson(e)).toList();
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
  List<Object?> get props => [data,dataLength,status,messages];
}

// ignore: must_be_immutable
class AllMyOrders  extends Equatable{
  int? id;
  int? code;
  String? type;
  String? requestNameAr;
  String? requestNameEn;
  String? date;
  String? statusAr;
  String? statusEn;
  bool? isEditable;

  AllMyOrders({this.id, this.code, this.type, this.requestNameAr, this.requestNameEn, this.date, this.statusAr, this.statusEn, this.isEditable});

  AllMyOrders.fromJson(Map<String, dynamic> json) {
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
   return[
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