// To parse this JSON data, do
//
//     final listClientModel = listClientModelFromJson(jsonString);

import 'dart:convert';

ListClientModel listClientModelFromJson(String str) => ListClientModel.fromJson(json.decode(str));

String listClientModelToJson(ListClientModel data) => json.encode(data.toJson());

class ListClientModel {
  ListClientModel({
    this.resCode,
    this.resMessage,
    this.resData,
  });

  int resCode;
  String resMessage;
  ResData resData;

  factory ListClientModel.fromJson(Map<String, dynamic> json) => ListClientModel(
    resCode: json["res_code"],
    resMessage: json["res_message"],
    resData: ResData.fromJson(json["res_data"]),
  );

  Map<String, dynamic> toJson() => {
    "res_code": resCode,
    "res_message": resMessage,
    "res_data": resData.toJson(),
  };
}

class ResData {
  ResData({
    this.listClient,
  });

  List<ListClient> listClient;

  factory ResData.fromJson(Map<String, dynamic> json) => ResData(
    listClient: List<ListClient>.from(json["list_client"].map((x) => ListClient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list_client": List<dynamic>.from(listClient.map((x) => x.toJson())),
  };
}

class ListClient {
  ListClient({
    this.clientId,
    this.typeId,
    this.firmName,
    this.personalName,
    this.address,
    this.city,
    this.state,
    this.country,
    this.email,
    this.website,
    this.mobileNo,
    this.wpNo,
    this.listClientStatus,
    this.createdDate,
    this.updatedDate,
    this.reqId,
    this.reqSize,
    this.qty,
    this.paymentType,
    this.creditTime,
    this.dealingWith,
    this.dealingFirm,
    this.dealingSince,
    this.communication,
    this.status,
  });

  String clientId;
  String typeId;
  String firmName;
  String personalName;
  String address;
  String city;
  String state;
  String country;
  String email;
  String website;
  String mobileNo;
  String wpNo;
  String listClientStatus;
  DateTime createdDate;
  DateTime updatedDate;
  String reqId;
  String reqSize;
  String qty;
  String paymentType;
  String creditTime;
  String dealingWith;
  String dealingFirm;
  String dealingSince;
  String communication;
  String status;

  factory ListClient.fromJson(Map<String, dynamic> json) => ListClient(
    clientId: json["client_id"],
    typeId: json["type_id"],
    firmName: json["firm_name"],
    personalName: json["personal_name"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    email: json["email"],
    website: json["website"],
    mobileNo: json["mobile_no"],
    wpNo: json["wp_no"],
    listClientStatus: json["status"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_date"]),
    reqId: json["req_id"],
    reqSize: json["req_size"],
    qty: json["qty"],
    paymentType: json["payment_type"],
    creditTime: json["credit_time"],
    dealingWith: json["dealing_with"],
    dealingFirm: json["dealing_firm"],
    dealingSince: json["dealing_since"],
    communication: json["communication"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "client_id": clientId,
    "type_id": typeId,
    "firm_name": firmName,
    "personal_name": personalName,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "email": email,
    "website": website,
    "mobile_no": mobileNo,
    "wp_no": wpNo,
    "status": listClientStatus,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.toIso8601String(),
    "req_id": reqId,
    "req_size": reqSize,
    "qty": qty,
    "payment_type": paymentType,
    "credit_time": creditTime,
    "dealing_with": dealingWith,
    "dealing_firm": dealingFirm,
    "dealing_since": dealingSince,
    "communication": communication,
    "Status": status,
  };
}
