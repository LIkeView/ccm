import 'dart:convert';
import 'dart:io';
import 'package:ccm/Api/api.dart';
import 'package:ccm/Login/loginPage.dart';
import 'package:ccm/Model/AddCoustomer.dart';
import 'package:ccm/Widgets/TextFieldWidgets.dart';
import 'package:ccm/main.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:toast/toast.dart';


class Person {
  final String name, surname;
  final num age;
  Person(this.name, this.surname, this.age);
}
class NavAddCoustomer extends StatefulWidget {
  @override

  _TextFieldscreenState createState() => _TextFieldscreenState();
}
class _TextFieldscreenState extends State<NavAddCoustomer> {

  String res_code,res_msg;
  AddCoustomer _apiResponse;
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


  String dropdownValue = 'City';

  List <String> spinnerItems = [
    'City',
    'Morbi'
  ] ;
  Widget submitButton() {
    return InkWell(
      onTap: ()
      async {
        final String FirmName = TextFieldWidget().Firm_Name.text;
        final String typeID = "1";
        final String PersonName = TextFieldWidget().Firm_Name.text;
        final String Address = TextFieldWidget().Firm_Name.text;
        final String City = TextFieldWidget().Firm_Name.text;
        final String StateOfCity = TextFieldWidget().Firm_Name.text;
        final String Country = TextFieldWidget().Firm_Name.text;
        final String Email = TextFieldWidget().Firm_Name.text;
        final String Website = TextFieldWidget().Firm_Name.text;
        final String MobileNo = TextFieldWidget().Firm_Name.text;
        final String WpNo = TextFieldWidget().Firm_Name.text;
        final String ReqSize = TextFieldWidget().Firm_Name.text;
        final String Qty = TextFieldWidget().Firm_Name.text;
        final String PaymentType = TextFieldWidget().Firm_Name.text;
        final String CreaditDate = TextFieldWidget().Firm_Name.text;
        final String DealingWith = TextFieldWidget().Firm_Name.text;
        final String DealingFirm = TextFieldWidget().Firm_Name.text;
        final String DealingSince = TextFieldWidget().Firm_Name.text;
        final String Communication = TextFieldWidget().Firm_Name.text;

        final AddCoustomer apiResponse = await ApiRepository().InsertData(FirmName , typeID , PersonName , Address , City , StateOfCity , Country , Email , Website,
            MobileNo,WpNo,ReqSize,Qty,PaymentType,CreaditDate,DealingWith,DealingFirm,DealingSince,Communication) ;
        setState(() {
          _apiResponse = apiResponse;
        });
        if (apiResponse.resCode == 1) {
//          Navigator.pop(context);
          print(apiResponse.resMessage);
            setState(() {
              MyHomePage().createState().currentIndex ;
              print(MyHomePage().createState().currentIndex);
            });
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => LoginPage()));
          Toast.show(
              apiResponse.resMessage, context, duration: Toast.LENGTH_SHORT,
              gravity: Toast.BOTTOM);
        }
        else {
          Toast.show(
              apiResponse.resMessage, context, duration: Toast.LENGTH_SHORT,
              gravity: Toast.BOTTOM);
        }
      },
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(143, 148, 251, 1),
                  Color.fromRGBO(143, 148, 251, .6),
                ]
            )),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

// array
  String TileSize_id ,Payment_Type,Coustomer_Type;
  List<String> TileSize = [
    "300 X 300 mm",
    "300 X 600 mm",
    "300 X 450 mm"
  ];
  List<String> PaymentType = [
    "Cash",
    "1 Month Credit",
    "2 Month Credit",
    "3 Month Credit",
    "6 Month Credit",
    "12 Month Credit",
  ];
  List<String> CoustomerType = [
    "High  Price Problem",
    "Have Dealers",
    "Design issue",
    "Quality Issue",
    "Now Not required",
    "Avalibity Issue",
  ];
  Widget _citydropdown(){
    return DropdownButton<String>(
      value: dropdownValue,
//      icon: Icon(Icons.arrow_drop_down_circle),
//      iconSize: 24,
      style: TextStyle(color: Colors.black, fontSize: 18),
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      onChanged: (String data) {
        setState(() {
          dropdownValue = data;
        });
      },
      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

  }

  static List<Person> people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Add"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
            getImage(ImgSource.Camera);
              },
            ),
          ],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
             Card(
               elevation:3,
               child: Form(child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(24),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Coustomer Datails"),
                            TextFieldWidget().buildFirmNameField(),
                            TextFieldWidget().buildPersonNameField(),
                            TextFieldWidget().buildAddress1Field(),
                            TextFieldWidget().buildAddress2Field(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
//                          crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: TextFieldWidget().cityField(),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: TextFieldWidget().StateField(),
                                        ),
                                      ),
                                    ),
                                    Center(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: TextFieldWidget().countryField(),
                                          ),
                                        )
                                    ),
                                  ]
                              ),
                            ),
                            TextFieldWidget().buildEmailField(),
                            TextFieldWidget().buildMobileField(),
                            TextFieldWidget().buildWhatsappNumberField(),
                            TextFieldWidget().buildWebsiteField(),
                          ],
                        ),
                      ),
                    ),
                  ]
              )),
            ),
             Card(
              elevation:2,
              child: Form(child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(24),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Requirement Datails"),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    DropDownField(
                                      onValueChanged: (dynamic value) {
                                        TileSize_id = value;
                                      },
                                      icon: FaIcon(FontAwesomeIcons.robot),
                                      value: TileSize_id,
                                      required: false,
                                      hintText: 'Tile Size',
                                      labelText: 'Requirment Size',
                                      items: TileSize,
                                    ),
                                  ]
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: new TextField(
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                style: TextStyle( color: Colors.black),
                                decoration: InputDecoration(
                                  fillColor: Colors.black12,
                                  filled: true,
                                  icon: FaIcon(FontAwesomeIcons.robot),
                                  hintText: 'Quantity',
                                  contentPadding:
                                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    DropDownField(
                                      onValueChanged: (dynamic value) {
                                        Payment_Type = value;
                                      },
                                      icon: FaIcon(FontAwesomeIcons.robot),
                                      value: Payment_Type,
                                      required: false,
                                      hintText: 'Type',
                                      labelText: 'Payment ',
                                      items: PaymentType,
                                    ),
                                  ]),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: new TextField(
                                        keyboardType: TextInputType.number,
                                        autofocus: false,
                                        style: TextStyle( color: Colors.black),
                                        decoration: InputDecoration(
                                          fillColor: Colors.black12,
                                          filled: true,
                                          icon: FaIcon(FontAwesomeIcons.robot),
                                          hintText: 'dealing_with',
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: new TextField(
                                        keyboardType: TextInputType.number,
                                        autofocus: false,
                                        style: TextStyle( color: Colors.black),
                                        decoration: InputDecoration(
                                          fillColor: Colors.black12,
                                          filled: true,
                                          icon: FaIcon(FontAwesomeIcons.robot),
                                          hintText: 'dealing_firm',
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: new TextField(
                                      keyboardType: TextInputType.number,
                                      autofocus: false,
                                      style: TextStyle( color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.black12,
                                        filled: true,
                                        icon: FaIcon(FontAwesomeIcons.robot),
                                        hintText: 'dealing_since',
                                        contentPadding:
                                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ]),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    _image != null ? Image.file(_image) : Container(),
                  ]
              )),
            ),
             Card(
              elevation:2,
              child: Form(child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(24),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Coustomer Type"),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    DropDownField(
                                      onValueChanged: (dynamic value) {
                                        Coustomer_Type = value;
                                      },
                                      value: Coustomer_Type,
                                      required: false,
                                      hintText: 'Type',
                                      labelText: 'Coustomer category',
                                      items: CoustomerType,
                                    ),
                                  ]),
                            ),
                            TextFieldWidget().CommunicationField(),
                            SizedBox(height: 10),
                            submitButton(),
                          ],
                        ),
                      ),
                    ),
                  ]
              )),
            ),
          ],
        ),
      ),
    );
  }
}



