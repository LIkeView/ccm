
import 'dart:io';
import 'package:ccm/BottomNavigation/NavAddCoustomer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'BottomNavigation/NavHome.dart';
import 'Login/welcomePage.dart';



void main() {
//  _setupLogging();
  runApp(MyApp());
}
//void _setupLogging() {
//  Logger.root.level = Level.ALL;
//  Logger.root.onRecord.listen((rec) => {
//    print("${rec.level.name}: ${rec.time} : ${rec.message}")
//  });
//}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  int currentIndex = 0;
//  int SubmitButtonIndex = NavAddCoustomer().createState().submitButton() as int;

  final tabs = [
    Center(child: NavHome()),
    Center(child: Text("Nev Search")),
    Center(child: NavAddCoustomer()),
    Center(child: Text("Nev save Data")),
    Center(child: Text("Nav Profile")),
  ];


  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,color: Colors.black),
              title: Text('Search')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,color: Colors.black),
              title: Text('Add')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.save,color: Colors.black),
              title: Text('Save')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black,),
              title: Text('Person')
          )
        ],
        onTap:(index) {
          setState(() {
            currentIndex = index;
//            SubmitButtonIndex = index;
          });
        },
      ),

    );
  }

}

class NAvImage extends StatefulWidget {
  @override
  _NAvImageState createState() => _NAvImageState();
}

class _NAvImageState extends State<NAvImage> {
  @override
  File _image;

  Future getImage(ImgSource source) async {
  var image = await ImagePickerGC.pickImage(
  context: context,
  source: source,
  cameraIcon: Icon(
  Icons.add,
  color: Colors.red,
  ),//cameraIcon and galleryIcon can change. If no icon provided default icon will be present
  );
  setState(() {
  _image = image;
  });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
        ),
        body: Center(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Container(
                  width: 300,

                  child: RaisedButton(

                    onPressed: () => getImage(ImgSource.Gallery),

                    color: Colors.blue,

                    child: Text(

                      "From Gallery".toUpperCase(),

                      style: TextStyle(color: Colors.white),

                    ),

                  ),


                ),

                  Container(

                    width: 300,

                    child: RaisedButton(

                      onPressed: () => getImage(ImgSource.Camera),

                      color: Colors.deepPurple,

                      child: Text(

                        "From Camera".toUpperCase(),

                        style: TextStyle(color: Colors.white),

                      ),

                    ),

                  ),

                  Container(

                    width: 300,

                    child: RaisedButton(

                      onPressed: () => getImage(ImgSource.Both),

                      color: Colors.red,

                      child: Text(

                        "Both".toUpperCase(),

                        style: TextStyle(color: Colors.white),

                      ),

                    ),

                  ),

                  _image != null ? Image.file(_image) : Container(),

                ],

            ),


        ),

        ),


  );

  }

}

