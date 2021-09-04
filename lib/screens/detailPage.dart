import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:codiumtest7/screens/profilePage.dart';

class DetailPage extends StatefulWidget {
  final String name, email, address, img;
  final String nameEdit, emailEdit, addressEdit;
  final DateTime date;
  @override
  _DetailPageState createState() => _DetailPageState();

  DetailPage({
    Key key,
    this.name,
    this.email,
    this.date,
    this.address,
    this.img,
    this.nameEdit,
    this.emailEdit,
    this.addressEdit,
  }) : super(key: key);
}

class _DetailPageState extends State<DetailPage> {
  String name, email, address, img;
  String nameEdit, emailEdit, addressEdit;
  DateTime date;
  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    date = widget.date;
    address = widget.address;
    img = widget.img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // SizedBox(
                          //   height: 30.0,
                          // ),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  margin: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    // child: Image.network('$varImg')
                                    child: Image.asset('images/$img'),
                                  ),
                                )
                              ]),
                          _nameForm(),
                          _emailForm(),
                          _birthDateForm(),
                          _addressFormTest(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => ProfilePage(),
          );
          Navigator.of(context).push(materialPageRoute);
        },
        child: Icon(Icons.save),
      ),
    );
  }

  GestureDetector _testAddress() {
    return GestureDetector(
      child: Container(
        width: 300,
        height: 120,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              //   // 'Address : ${userModel.address}',
              child: Text(
                // 'Tel : $varTel',
                'Address : $address',
                style: GoogleFonts.prompt(
                  textStyle:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        TextField(
              onChanged: (value) => nameEdit = value.trim(),
              decoration: InputDecoration(
                labelText: '$name',
                labelStyle: GoogleFonts.prompt(
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Color(0xFFF3F5F8),
                filled: true,
              ),
            );
      },
    );
  }

  Widget _nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //margin: const EdgeInsets.only(),
            width: MediaQuery.of(context).size.width * 0.83,
            height: 48,
            child: TextField(
              onChanged: (value) => nameEdit = value.trim(),
              decoration: InputDecoration(
                labelText: '$name',
                labelStyle: GoogleFonts.prompt(
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Color(0xFFF3F5F8),
                filled: true,
              ),
            ),
          ),
        ],
      );
  Widget _emailForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //margin: const EdgeInsets.only(),
            width: MediaQuery.of(context).size.width * 0.83,
            height: 48,
            child: TextField(
              onChanged: (value) => nameEdit = value.trim(),
              decoration: InputDecoration(
                labelText: '$email',
                labelStyle: GoogleFonts.prompt(
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Color(0xFFF3F5F8),
                filled: true,
              ),
            ),
          ),
        ],
      );

  Widget _birthDateForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //margin: const EdgeInsets.only(),
            width: MediaQuery.of(context).size.width * 0.83,
            height: 48,
            child: TextField(
              onChanged: (value) => nameEdit = value.trim(),
              decoration: InputDecoration(
                labelText: '$date',
                labelStyle: GoogleFonts.prompt(
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Color(0xFFF3F5F8),
                filled: true,
              ),
            ),
          ),
        ],
      );
  Widget _addressFormTest() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //margin: const EdgeInsets.only(),
            width: MediaQuery.of(context).size.width * 0.83,
            height: MediaQuery.of(context).size.height * 0.5,
            // height: 48,
            child: TextField(
              onChanged: (value) => nameEdit = value.trim(),
              // maxLines: null,
              decoration: InputDecoration(
                labelText: '$address',
                labelStyle: GoogleFonts.prompt(
                  textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Color(0xFFF3F5F8),
                filled: true,
              ),
            ),
          ),
        ],
      );

  Widget _addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //margin: const EdgeInsets.only(),
            width: MediaQuery.of(context).size.width * 0.83,
            // height: MediaQuery.of(context).size.height * 0.5,
            // height: 300,
            child: Container(
              height: 100.0,
              child: TextField(
                keyboardType: TextInputType.multiline,
                expands: true,
                onChanged: (value) => nameEdit = value.trim(),
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: '$address',
                  labelStyle: GoogleFonts.prompt(
                    textStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color(0xFFF3F5F8),
                  filled: true,
                ),
              ),
            ),
          ),
        ],
      );
}
