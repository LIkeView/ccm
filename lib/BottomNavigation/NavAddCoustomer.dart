import 'dart:convert';
import 'dart:io';
import 'package:ccm/Api/api.dart';
import 'package:ccm/Login/loginPage.dart';
import 'package:ccm/Model/AddCoustomer.dart';
import 'package:ccm/Widgets/DropDownWidgets.dart';
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










  final TextEditingController Firm_Name = TextEditingController();
  final TextEditingController Person_Name = TextEditingController();
  final TextEditingController AddressLine1 = TextEditingController();
  final TextEditingController AddressLine2 = TextEditingController();
  final TextEditingController City = TextEditingController();
  final TextEditingController State = TextEditingController();
  final TextEditingController Country = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Mobile = TextEditingController();
  final TextEditingController Whatsapp = TextEditingController();
  final TextEditingController Web = TextEditingController();
  final TextEditingController Size = TextEditingController();
  final TextEditingController Unit = TextEditingController();
  final TextEditingController Communication = TextEditingController();



  String _firm_name = "" , _person_name = "" , _address1="" ,_address2="" , _city="" , _State="" , _country="",
      _email="",_mobile="",_whatsapp="" ,_web="" , _size="" , _unit="" , _communication="";

  Widget _buildFirmNameField(){
    return
      TextFormField(
        controller: Firm_Name,
        decoration: InputDecoration(
            icon: new FaIcon(FontAwesomeIcons.building),
            labelText: "Firm Name"),
//        validator: (String value){
//          if(value.isEmpty){
//            return 'FirmName is Required';
//          }
//        },
//        onSaved: (String value){
//          _firm_name = value;
//        },
      );
  }

  Widget _buildPersonNameField(){
    return TextFormField(
      controller: Firm_Name,
      decoration: InputDecoration(
          icon: new Icon(Icons.person),
          labelText: "Person Name"),

    );
  }

  Widget _buildAddress1Field(){
    return TextFormField(
      controller: AddressLine1,
      decoration: InputDecoration(
          icon: FaIcon(FontAwesomeIcons.addressCard),
          labelText: "Address Line 1"),
      validator: (String value){
        if(value.isEmpty){
          return 'Address is Required';
        }
      },
      onSaved: (String value){
        _address1 = value;
      },
    );
  }

  Widget _buildAddress2Field(){
    return TextFormField(
      controller: AddressLine2,
      decoration: InputDecoration(
          icon: FaIcon(FontAwesomeIcons.addressCard),
          labelText: "Address Line 2"),
      onSaved: (String value){
        _address2 = value;
      },
    );
  }



  Widget _countryField(){
    return Container(
      width: 80,
      child: TextFormField(
        decoration: InputDecoration(labelText: "Country"),
        onSaved: (String value){
          _country = value;
        },
      ),
    );
  }


  Widget _StateField(){
    return Container(
      width: 80,
      child: TextFormField(
        controller: State,
        decoration: InputDecoration(labelText: "State"),
        onSaved: (String value){
          _State = value;
        },
      ),

    );
  }

  Widget _cityField(){
    return Container(
      width: 120,
      child: TextFormField(
        controller: City,
        decoration: InputDecoration(
            icon: FaIcon(FontAwesomeIcons.city),
            labelText: "City"),
        onSaved: (String value){
          _city = value;
        },
      ),

    );

  }

  Widget _buildEmailField(){
    return TextFormField(
      controller: Email,
      decoration: InputDecoration(
          icon: FaIcon(FontAwesomeIcons.envelope),
          labelText: "Email"),

      onSaved: (String value){
        _email = value;
      },
    );
  }
  Widget _buildMobileField(){
    return TextFormField(
      controller: Mobile,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: new Icon(Icons.call),
          labelText: "Mobile No"),
      onSaved: (String value){
        _mobile = value;
      },
    );
  }
  Widget _buildWhatsappNumberField(){
    return TextFormField(
      controller: Whatsapp,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: FaIcon(FontAwesomeIcons.whatsapp),
          labelText: "Whats app no"),

      onSaved: (String value){
        _whatsapp = value;
      },
    );
  }
  Widget _buildWebsiteField(){
    return TextFormField(
      controller: Web,
      decoration: InputDecoration(
          icon: FaIcon(FontAwesomeIcons.globe),
          labelText: "Web url"),

      onSaved: (String value){
        _web = value;
      },
    );
  }

  Widget _SizeField(){
    return Container(
      width: 120,
      child: TextFormField(
        controller: Size,
        decoration: InputDecoration(
            labelText: "Size"),
        onSaved: (String value){
          _size = value;
        },
      ),
    );

  }

  Widget _UnitField(){
    return Container(
      width: 120,
      child: TextFormField(
        controller: Unit,
        decoration: InputDecoration(
            labelText: "Unit"),
        onSaved: (String value){
          _unit = value;
        },
      ),
    );
  }

  Widget _CommunicationField(){
    return Container(
      child: TextFormField(
        controller: Communication,
        decoration: InputDecoration(
//          icon: new FaIcon(FontAwesomeIcons.building),
            labelText: "communication"),
        validator: (String value){
          if(value.isEmpty){
            return 'FirmName is Required';
          }
        },
        onSaved: (String value){
          _communication = value;
        },
      ),

    );
  }





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
        final String FirmName = Firm_Name.text;
        final String typeID = "1";
        final String PersonName = Firm_Name.text;
        final String Address = Firm_Name.text;
        final String City = Firm_Name.text;
        final String StateOfCity = Firm_Name.text;
        final String Country = Firm_Name.text;
        final String Email = Firm_Name.text;
        final String Website = Firm_Name.text;
        final String MobileNo = Firm_Name.text;
        final String WpNo = Firm_Name.text;
        final String ReqSize = Firm_Name.text;
        final String Qty = Firm_Name.text;
        final String PaymentType = Firm_Name.text ;
        final String CreaditDate = Firm_Name.text;
        final String DealingWith = Firm_Name.text;
        final String DealingFirm = Firm_Name.text;
        final String DealingSince = Firm_Name.text;
        final String Communication = Firm_Name.text;

        final AddCoustomer apiResponse = await ApiRepository().InsertData(FirmName , typeID , PersonName , Address , City , StateOfCity , Country , Email , Website,
            MobileNo,WpNo,ReqSize,Qty,PaymentType,CreaditDate,DealingWith,DealingFirm,DealingSince,Communication) ;
        setState(() {
          _apiResponse = apiResponse;
        });
        if (apiResponse.resCode == 1) {
//          Navigator.pop(context);
          print(apiResponse.resMessage);
          Toast.show(
              FirmName+ apiResponse.resMessage, context, duration: Toast.LENGTH_SHORT,
              gravity: Toast.CENTER);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));

        }
        else {
          Toast.show(
              apiResponse.resMessage, context, duration: Toast.LENGTH_SHORT,
              gravity: Toast.CENTER);
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


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
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
                            _buildFirmNameField(),
                            _buildPersonNameField(),
                            _buildAddress1Field(),
                            _buildAddress2Field(),
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
                            _buildEmailField(),
                            _buildMobileField(),
                            _buildWhatsappNumberField(),
                            _buildWebsiteField(),
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
//                            Container(
//                              padding: EdgeInsets.all(5.0),
//                              child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                                  children: <Widget>[
//                                    DropDownField(
//                                      onValueChanged: (dynamic value) {
//                                        TileSize_id = value;
//                                      },
//                                      icon: FaIcon(FontAwesomeIcons.robot),
//                                      value: TileSize_id,
//                                      required: false,
//                                      hintText: 'Tile Size',
//                                      labelText: 'Requirment Size',
//                                      items: TileSize,
//                                    ),
//                                  ]
//                              ),
//                            ),
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
                                  hintText: 'Tiles Size',
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
                              child: new TextField(
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                style: TextStyle( color: Colors.black),
                                decoration: InputDecoration(
                                  fillColor: Colors.black12,
                                  filled: true,
                                  icon: FaIcon(FontAwesomeIcons.robot),
                                  hintText: 'Payment Type',
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

//                            Container(
//                              padding: EdgeInsets.all(5.0),
//                              child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                                  children: <Widget>[
//                                    DropDownField(
//                                      onValueChanged: (dynamic value) {
//                                        Payment_Type = value;
//                                      },
//                                      icon: FaIcon(FontAwesomeIcons.robot),
//                                      value: Payment_Type,
//                                      required: false,
//                                      hintText: 'Type',
//                                      labelText: 'Payment ',
//                                      items: PaymentType,
//                                    ),
//                                  ]),
//                            ),
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
                                  hintText: 'Dealing With',
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
                                  hintText: 'Dealing Firm',
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
                                  hintText: 'Dealing Since',
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



