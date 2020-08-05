import 'dart:convert';

AddCoustomer apiResponseFromJson(String str) => AddCoustomer.fromJson(json.decode(str));

String apiResponseToJson(AddCoustomer data) => json.encode(data.toJson());

class AddCoustomer {
  AddCoustomer({
    this.resCode,
    this.resMessage,
    this.resData,
  });

  int resCode;
  String resMessage;
  List<dynamic> resData;

  factory AddCoustomer.fromJson(Map<String, dynamic> json) => AddCoustomer(
    resCode: json["res_code"],
    resMessage: json["res_message"],
    resData: List<dynamic>.from(json["res_data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "res_code": resCode,
    "res_message": resMessage,
    "res_data": List<dynamic>.from(resData.map((x) => x)),
  };
}