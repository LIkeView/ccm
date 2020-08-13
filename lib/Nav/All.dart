import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class AllType extends StatefulWidget {
  @override
  _AllTypeState createState() => _AllTypeState();
}

class _AllTypeState extends State<AllType> {
  bool isLoading = false;

  final String url = "http://4foxwebsolution.com/ccmsystem.com/api/listClient";
  List data;
  var newdata;
  String value = "1";
  String pageNo = "3";

  @override
  void initState() {
    super.initState();
    this.getJsonDataForList();

  }

//  void getHttp() async {
//    try {
//      Dio dio = new Dio();
//      Response response =
//          await dio.post(Uri.encodeFull(url), data: {"type_id": value});
//      print(response);
//    } catch (e) {
//      print(e);
//    }
//  }

  Future<String> getJsonDataForList() async {
//    Dio dio = new Dio();
//    Response response = await dio.post(url, data: {"type_id" : value });
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var response = await http.post(
        // Encode the url
          Uri.encodeFull(url),
          body: {
            "type_id": value,
            "page" : pageNo
          }
        //only accept json response
        //headers: {"Accept": "application/json"}
      );
      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          var listClientModelFromJson = json.decode(response.body);
          data = listClientModelFromJson["res_data"]["list_client"];
        });
      }
      return "Success";
    }
  }
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = TextStyle(color: Colors.blue);
    return SafeArea(
      child: Scaffold(
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {

//              if(index == data.length){
//                return _buildProgressIndicator();
//              }
//              else{
                return
                  new Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      margin: const EdgeInsets.all(5.0),
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 4.0,left: 5.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: new CircleAvatar(
                                    child: Text(data[index]["firm_name"][0].toString().toUpperCase(),style: TextStyle(color: Colors.white),),
                                    backgroundImage: new NetworkImage(url),
                                    backgroundColor: Colors.black45,
                                    radius: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: new Container(
                              padding: new EdgeInsets.only(left: 8.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
                                    child: Row(
                                      children: <Widget>[
                                        new Text(
                                          data[index]["firm_name"][0].toString().toUpperCase()+data[index]["firm_name"].toString().substring(1),
                                          style: new TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
//                                  Icon(Icons.person),
                                      Text(data[index]["personal_name"][0].toString().toUpperCase() + data[index]["personal_name"].toString().substring(1),
                                        style: new TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,

                                        ),

                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
                                    child: Row(

                                      children: <Widget>[
                                        Icon(Icons.call,size: 14,color: Colors.grey,),
                                        RichText(
                                          text: TextSpan(
                                            style: defaultStyle,
                                            children: <TextSpan>[
//                                      TextSpan(text: 'By clicking Sign Up, you agree to our '),
                                              TextSpan(
                                                  text: "  "+data[index]["mobile_no"]+"   ",
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                  ),
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {launch("tel://"+data[index]["mobile_no"]);}
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            FaIcon(FontAwesomeIcons.whatsapp,size: 14,color: Colors.grey,),
                                            RichText(
                                              text: TextSpan(
                                                style: defaultStyle,
                                                children: <TextSpan>[
//                                      TextSpan(text: 'By clicking Sign Up, you agree to our '),
                                                  TextSpan(
                                                    text: "  "+data[index]["wp_no"],
                                                    style: new TextStyle(
                                                      fontSize: 14.0,

                                                      color: Colors.grey,
                                                    ),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        await FlutterLaunch.launchWathsApp(phone: data[index]["wp_no"], message: "Hello");},
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),

                                      ],
                                    ),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0, bottom: 10.0),

                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.mail,size: 14,color: Colors.grey,),

                                        new Text("  "+
                                            data[index]["email"],
                                          style: new TextStyle(
                                            fontSize: 16.0,

                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),



//                              Padding(
//                                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
//                                child: Row(
//                                  children: <Widget>[
//                                    FaIcon(FontAwesomeIcons.whatsapp),
//                                    RichText(
//                                      text: TextSpan(
//                                        style: defaultStyle,
//                                        children: <TextSpan>[
////                                      TextSpan(text: 'By clicking Sign Up, you agree to our '),
//                                          TextSpan(
//                                            text: "  "+data[index]["wp_no"],
//                                            style: new TextStyle(
//                                              fontSize: 14.0,
//
//                                              color: Colors.grey,
//                                            ),
//                                            recognizer: TapGestureRecognizer()
//                                              ..onTap = () async {
//                                                await FlutterLaunch.launchWathsApp(phone: data[index]["wp_no"], message: "Hello");},
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                  ],
//                                ),
//                              ),

                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                IconButton(

                                  icon: Icon(
                                    Icons.save,
                                    size: 24,
                                  ),

//                              iconSize: 20,
                                  color: Colors.black,
                                  splashColor: Colors.black26,
                                  onPressed: () {},
                                ),

//                            new Text(
//                              "9:50",
//                              style: new TextStyle(
//                                  color: Colors.lightGreen, fontSize: 12.0),
//                            ),
//                            new CircleAvatar(
//                              backgroundColor: Colors.lightGreen,
//                              radius: 10.0,
//                              child: new Text(
//                                "2",
//                                style: new TextStyle(
//                                    color: Colors.white, fontSize: 12.0),
//                              ),
//                            )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
//              }
            }),
      ),
    );
  }
//  Widget _buildProgressIndicator() {
//    return new Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: new Center(
//        child: new Opacity(
//          opacity: isLoading ? 1.0 : 00,
//          child: new CircularProgressIndicator(),
//        ),
//      ),
//    );
//  }
}
