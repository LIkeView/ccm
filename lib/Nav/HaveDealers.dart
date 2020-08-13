import 'dart:convert';

import 'package:ccm/Api/api.dart';
import 'package:ccm/Model/ListClientModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:search_page/search_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}

class HaveDealers extends StatefulWidget {
  @override
  _HaveDealersState createState() => _HaveDealersState();
}

class _HaveDealersState extends State<HaveDealers> {

  static List<Person> people = [
    Person('Mike', 'Barron', 1),
    Person('Mike', 'Barron', 2),
    Person('Todd', 'Black', 3),
    Person('Ahmad', 'Edwards', 4),
    Person('Anthony', 'Johnson', 5),
    Person('Annette', 'Brooks', 6),
    Person('Annette', 'Brooks', 7),
    Person('Annette', 'Brooks', 8),
    Person('dk', 'Brooks', 9),
  ];

  final String url = "http://4foxwebsolution.com/ccmsystem.com/api/listClient";
  List data;
  var  newdata;
  String value = "2";
  String Name ="";
  @override
  void initState(){
    super.initState();
    this.getJsonDataForList();
  }
  void getHttp() async {
    try {
      Dio dio = new Dio();
      Response response = await dio.post(Uri.encodeFull(url) ,  data: {"type_id" : value });
      print(response);
    } catch (e) {
      print(e);
    }
  }
  Future<String> getJsonDataForList() async{
//    Dio dio = new Dio();
//    Response response = await dio.post(url, data: {"type_id" : value });

    var response = await http.post(
      // Encode the url
        Uri.encodeFull(url), body: {
      "type_id" : value ,
    }
      //only accept json response
      //headers: {"Accept": "application/json"}
    );
    if(response.statusCode == 200) {
      print(response.body);
      setState(() {
        var listClientModelFromJson = json.decode(response.body);
//     data = convertDataToJson['res_data'];
        data = listClientModelFromJson["res_data"]["list_client"];
      });
    }
    return "Success";
  }


  @override
  Widget build(BuildContext context){

    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = TextStyle(color: Colors.blue);
    return SafeArea(
      child: Scaffold(
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index){
              return
                  new Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      margin: const EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.person),
                                    Text(
                                        data[index]["firm_name"], style: new TextStyle(
                                        fontSize: 20.0, color: Colors.black)
                                    )                               ],
                                ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.person),

                                  Text(data[index]["personal_name"], maxLines: 2,
                                      style: new TextStyle(
                                          fontSize: 20.0, color: Colors.black)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.call),
                                    RichText(
                                      text: TextSpan(
                                      style: defaultStyle,
                                      children: <TextSpan>[
//                                      TextSpan(text: 'By clicking Sign Up, you agree to our '),
                                      TextSpan(
                                          text: "  "+data[index]["mobile_no"],
                                      style: new TextStyle(
                                        fontSize: 18.0, color: Colors.black,
                                      ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {launch("tel://"+data[index]["mobile_no"]);}
                                            ),
                                    ],
                                  ),
                                )
                                  ],
                                ),

                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                              child: Row(
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.whatsapp),
                                  RichText(
                                    text: TextSpan(
                                      style: defaultStyle,
                                      children: <TextSpan>[
//                                      TextSpan(text: 'By clicking Sign Up, you agree to our '),
                                        TextSpan(
                                          text: "  "+data[index]["wp_no"],
                                          style: new TextStyle(
                                            fontSize: 18.0, color: Colors.black,
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
                            ),


                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(1),
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                  ),
                                  iconSize: 20,
                                  color: Colors.black,
                                  splashColor: Colors.black26,
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(1),
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.bookmark_border,
                                  ),
                                  iconSize: 20,
                                  color: Colors.black,
                                  splashColor: Colors.black26,
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  );
//                new ListTile(
//                  title: Text(data[index]["fes_name"]),
//                  subtitle: Text(data[index]["m_date"]),
//                );
            }
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Search people',
          onPressed: () => showSearch(
            context: context,
            delegate: SearchPage<Person>(
              items: people,
              searchLabel: 'Search',
              suggestion: Center(
                child: Text('Search Clint by Clint Name, Clint Type'),
              ),
              failure: Center(
                child: Text('No person found :('),
              ),
              filter: (person) => [
                person.name,
                person.surname,
                person.age.toString(),
              ],
              builder: (person) => ListTile(
                title: Text(person.name),
//                subtitle: Text(person.surname),
//                trailing: Text('${person.age} Year'),
              ),
            ),
          ),
          child: Icon(Icons.search),
        ),

      ),

    );
  }}



