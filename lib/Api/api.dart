import 'dart:convert';

import 'package:ccm/Model/AddCoustomer.dart';
import 'package:ccm/Model/ListClientModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiRepository {

  Future<AddCoustomer> InsertData(String FirmName, String TypeID , String PersonName, String Address, String City, String StateOfCity,
      String Country,String Email,String Website,String MobileNo,String WpNo,String ReqSize,String Qty,String PaymentType,String CreaditDate,
      String DealingWith,String DealingFirm,String DealingSince,String Communication) async{

    final String apiUrl = "http://4foxwebsolution.com/ccmsystem.com/api/addCoustomer";

    final response = await http.post(apiUrl, body: {
      "firm_name": FirmName,
      "type_id": TypeID,
      "personal_name": PersonName,
      "address": Address,
      "city":  City,
      "state": StateOfCity,
      "country": Country,
      "email": Email,
      "website": Website,
      "mobile_no": MobileNo,
      "wp_no": WpNo,
      "req_size": ReqSize,
      "qty": Qty,
      "payment_type":PaymentType,
      "credit_date": CreaditDate,
      "dealing_with": DealingWith,
      "dealing_firm": DealingFirm,
      "dealing_since": DealingSince,
      "communication": Communication

    });

    if(response.statusCode == 200){
      final String responseString = response.body;
//      var email = prefs.getString("email_or_phones");
//      print(email);
      return apiResponseFromJson(responseString);
    }else{
      return null;
    }
  }

}


