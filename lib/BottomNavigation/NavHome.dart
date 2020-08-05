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
      color: Colors.white,
    ),
    Container(
      child: AllType(),
    ),
    Container(
      color: Colors.white,
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
          title: Text("Home"),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'all',
              ),
              Tab(
                text: "High Price",
              ),
              Tab(
                text: 'Have Dealers',
              ),
              Tab(
                text: "Design Issue",
              ),
              Tab(
                text: 'Quality Issue',
              ),
              Tab(
                text: "Now Not Required",
              ),
              Tab(
                text: 'Avaliblity',
              ),
              Tab(
                text: 'Pending',
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