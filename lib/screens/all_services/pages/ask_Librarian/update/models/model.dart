// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UpdateAskModel extends Equatable {
  dynamic data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  UpdateAskModel({this.data, this.messages, this.status, this.dataLength});

  UpdateAskModel.fromJson(Map<String, dynamic> json) {
    data = json["data"];
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = this.data;
    if (messages != null) {
      data["messages"] = messages;
    }
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}
