import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DemoState();
}

class DemoState extends State<Demo> {
  static int page = 0;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List users = new List();
  final dio = new Dio();
  @override
  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lazy Load Large List"),
      ),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: users.length + 1, // Add one more item for progress indicator
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (BuildContext context, int index) {
        if (index == users.length) {
          return _buildProgressIndicator();
        } else {
          return new ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                users[index]["mobile_no"],
              ),
            ),
            title: Text((users[index]["mobile_no"])),
            subtitle: Text((users[index]["mobile_no"])),
          );
        }
      },
      controller: _sc,
    );
  }

//  void _getMoreData(int index) async {
//    if (!isLoading) {
//      setState(() {
//        isLoading = true;
//      });
//      var url = "https://randomuser.me/api/?page=" +
//          index.toString() +
//          "&results=20&seed=abc";
//      print(url);
//      final response = await dio.get(url);
//      List tList = new List();
//      for (int i = 0; i < response.data['results'].length; i++) {
//        tList.add(response.data['results'][i]);
//      }
//
//      setState(() {
//        isLoading = false;
//        users.addAll(tList);
//        page++;
//      });
//    }
//  }
  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = "http://4foxwebsolution.com/ccmsystem.com/api/listClient";
      print(url);
      final response = await dio.post(url,data: {
        "type_id" : "1" ,
        "page" : index.toString()

      });
      List tList = new List();
      for (int i = 0; i < response.data['res_data']['list_client'].length; i++) {
        tList.add(response.data['res_data']['list_client'][i]);
      }

      setState(() {
        isLoading = false;
        users.addAll(tList);
        page++;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

}