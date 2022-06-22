import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UpdateVisitRequestModel extends Equatable {
  dynamic data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  UpdateVisitRequestModel(
      {this.data, this.messages, this.status, this.dataLength});

  UpdateVisitRequestModel.fromJson(Map<String, dynamic> json) {
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
