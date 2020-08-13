import 'package:ccm/Nav/All.dart';
import 'package:ccm/Nav/Demo.dart';
import 'package:ccm/Nav/HaveDealers.dart';
import 'package:flutter/material.dart';
class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}
class NavHome extends StatefulWidget {
  @override


  _NavHomeState createState() => _NavHomeState();
}
class _NavHomeState extends State<NavHome> {
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
  List<Widget> containers = [
    Container(
      child: AllType(),
    ),
    Container(
      child: HaveDealers(),
    ),
    Container(
      child: Demo(),
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.white,
    ), Container(
      color: Colors.white,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("CCM SYSTEM"),
          backgroundColor: Colors.black,
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'All'.toUpperCase(),
              ),
              Tab(
                text: "High Price".toUpperCase(),
              ),
              Tab(
                text: 'Have Dealers'.toUpperCase(),
              ),
              Tab(
                text: "Design Issue".toUpperCase(),
              ),
              Tab(
                text: 'Quality Issue'.toUpperCase(),
              ),
              Tab(
                text: "Now Not Required".toUpperCase(),
              ),
              Tab(
                text: 'Avaliblity'.toUpperCase(),
              ),
              Tab(
                text: 'Pending'.toUpperCase(),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: containers,
        ),
//        floatingActionButton: FloatingActionButton(
//          tooltip: 'Search people',
//
//          onPressed: () => showSearch(
//            context: context,
//            delegate: SearchPage<Person>(
//              items: people,
//              searchLabel: 'Search',
//              suggestion: Center(
//                child: Text('Search Clint by Clint Name, Clint Type'),
//              ),
//              failure: Center(
//                child: Text('No person found :('),
//              ),
//              filter: (person) => [
//                person.name,
//                person.surname,
//                person.age.toString(),
//              ],
//              builder: (person) => ListTile(
//                title: Text(person.name),
//                subtitle: Text(person.surname),
//                trailing: Text('${person.age} Year'),
//              ),
//            ),
//          ),
//          child: Icon(Icons.search),
//        ),
      ),
    );
  }
}