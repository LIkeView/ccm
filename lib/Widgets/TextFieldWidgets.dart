import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldWidget{
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

  Widget buildFirmNameField(){
    return
      TextFormField(
        controller: Firm_Name,
        decoration: InputDecoration(
            icon: new FaIcon(FontAwesomeIcons.building),
            labelText: "Firm Name"),
        validator: (String value){
          if(value.isEmpty){
            return 'FirmName is Required';
          }
        },
        onSaved: (String value){
          _firm_name = value;
        },
      );
  }

  Widget buildPersonNameField(){
    return TextFormField(
      controller: Person_Name,
      decoration: InputDecoration(
          icon: new Icon(Icons.person),
          labelText: "Person Name"),
      validator: (String value){
        if(value.isEmpty){
          return 'Person Name is Required';
        }
      },
      onSaved: (String value){
        _person_name = value;
      },
    );
  }

  Widget buildAddress1Field(){
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

  Widget buildAddress2Field(){
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



  Widget countryField(){
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


  Widget StateField(){
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

  Widget cityField(){
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

  Widget buildEmailField(){
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
  Widget buildMobileField(){
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
  Widget buildWhatsappNumberField(){
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
  Widget buildWebsiteField(){
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

  Widget SizeField(){
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

  Widget UnitField(){
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

  Widget CommunicationField(){
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


}