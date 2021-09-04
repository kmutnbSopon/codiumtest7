import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:codiumtest7/model/profileModel.dart';
import 'package:codiumtest7/helper/databaseHelper.dart';
import 'package:intl/intl.dart';
import 'package:codiumtest7/screens/detailPage.dart';

class ProfilePage extends StatefulWidget {
  final ProfileModel profileModel;
  String name2;
  @override
  _ProfilePageState createState() => _ProfilePageState();

  ProfilePage({
    Key key,
    this.profileModel,
    this.name2,
  }) : super(key: key);
}

class _ProfilePageState extends State<ProfilePage> {
  Future<List<ProfileModel>> _profileList;
  // final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  ProfileModel profileModel;
  List<ProfileModel> profileModels = List();

  final _formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  DateTime _dateString;
  String _address;

  String name2;
  // TextEditingController _dateController = TextEditingController();

  // DateTime _date = DateTime.parse(_dateString);

  final allProfiles = <ProfileModel>[
    ProfileModel(
        name: 'Athana q',
        email: 'athana@codium.co',
        date: DateTime.parse("1998-10-11"),
        address:
            'Siam@Siam Hotel Building , 7Th Floor 865 Rama 1 Road Wang Mai , Pathumwan Bangkok 10330 , Thailand',
        img: 'galdot.png'),
    ProfileModel(
        name: 'John Wick',
        email: 'john.w@codium.co',
        date: DateTime.parse("1998-10-11"),
        address:
            'Siam@Siam Hotel Building , 7Th Floor 865 Rama 1 Road Wang Mai , Pathumwan Bangkok 10330 , Thailand',
        img: 'johnwick.png'),
    ProfileModel(
        name: 'Donald Trump',
        email: 'donald.t@codium.co',
        date: DateTime.parse("1998-10-11"),
        address:
            'Siam@Siam Hotel Building , 7Th Floor 865 Rama 1 Road Wang Mai , Pathumwan Bangkok 10330 , Thailand',
        img: 'trump.png'),
    ProfileModel(
        name: 'Elizabeth Olsens',
        email: 'eliza.o@codium.co',
        date: DateTime.parse("1998-10-11"),
        address:
            'Siam@Siam Hotel Building , 7Th Floor 865 Rama 1 Road Wang Mai , Pathumwan Bangkok 10330 , Thailand',
        img: 'olsens.png'),
  ];
  @override
  void initState() {
    super.initState();
    profileModel = widget.profileModel;
    name2 = widget.name2;

    // if (widget.profileModel != null) {
    //   _name = widget.profileModel.name;
    //   _email = widget.profileModel.email;
    //   _dateString = widget.profileModel.date;
    //   _address = widget.profileModel.address;
    // }
    // _dateController.text = _dateFormatter.format(_dateString);
    // _updateProfileList();
    // for(int i=0;i<4;i++){
    //   _readProfile(allProfiles[i],i);
    // }

    // for(int i=0;i<4;i++){
    //   print('images/${allProfiles[i].img}');
    // }
  }

  _updateProfileList() {
    setState(() {
      _profileList = DatabaseHelper.instance.getProfileList();
    });
  }

  _readProfile(ProfileModel profileModel, int index) {
    // if (_formKey.currentState.validate()) {
    // _formKey.currentState.save();
    print('$_name,$_email, $_dateString,$_address');

    //Insert the task to our user's database

    ProfileModel profileModel = ProfileModel(
        name: profileModels[index].name,
        email: profileModels[index].email,
        date: profileModels[index].date,
        address: profileModels[index].address);
    if (widget.profileModel == null) {
      // profileModel.status = 0;
      DatabaseHelper.instance.insertProfile(profileModel);
    } else {
      profileModel.id = widget.profileModel.id;
      // profileModel.status = widget.profileModel.status;
      DatabaseHelper.instance.updateProfile(profileModel);
    }
    _updateProfileList();
    //Update the task
    Navigator.pop(context);
    // }
  }

  // Widget _buildProfile(ProfileModel profileModel) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             color: Colors.white,
  //             // child: Text(
  //             //   'Total member : $reccount ',
  //             //   style: TextStyle(fontSize: 18, color: Colors.blueGrey[300]),
  //             // ),
  //           ),
  //         ],
  //       ),
  //       Expanded(
  //         child: ListView.builder(
  //           itemCount: allProfiles.length,
  //           itemBuilder: (context, index) => Container(
  //             margin: EdgeInsets.all(8.0),
  //             // height: MediaQuery.of(context).size.height / 1.50,
  //             // width: MediaQuery.of(context).size.width,
  //             child: Card(
  //               color: Colors.lightBlueAccent[50],
  //               elevation: 8,
  //               child: ListTile(
  //                 title: Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     avatar(context, index),
  //                     Column(
  //                       children: <Widget>[
  //                         formDetail(index),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 onTap: () {
  //                   print('OK');
  //                   // MaterialPageRoute materialPageRoute = MaterialPageRoute(
  //                   //   builder: (BuildContext context) => DetailPage(),
  //                   // );
  //                   // Navigator.of(context).push(materialPageRoute);
  //                 },
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  // child: Text(
                  //   'Total member : $reccount ',
                  //   style: TextStyle(fontSize: 18, color: Colors.blueGrey[300]),
                  // ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allProfiles.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(8.0),
                  // height: MediaQuery.of(context).size.height / 1.50,
                  // width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.lightBlueAccent[50],
                    elevation: 8,
                    child: ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          avatar(context, index),
                          Column(
                            children: <Widget>[
                              formDetail(index),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        print('OK');
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => DetailPage(
                            name: allProfiles[index].name,
                            email: allProfiles[index].email,
                            date: allProfiles[index].date,
                            address: allProfiles[index].address,
                            img: allProfiles[index].img,
                          ),
                        );
                        Navigator.of(context).push(materialPageRoute);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: FutureBuilder(
      //   future: _profileList,
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     // final int completedTaskCount = snapshot.data
      //     //     .where((ProfileModel profileModel) => profileModel.status == 1)
      //     //     .toList()
      //     //     .length;

      //     return ListView.builder(
      //       padding: EdgeInsets.symmetric(vertical: 50.0),
      //       itemCount: 1 + snapshot.data.length,
      //       // ignore: missing_return
      //       itemBuilder: (BuildContext context, int index) {
      //         if (index == 0) {
      //           return Padding(
      //             padding:
      //                 EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 Text(
      //                   'Person',
      //                   style: GoogleFonts.prompt(
      //                     textStyle: TextStyle(
      //                         fontSize: 40.0, fontWeight: FontWeight.w700),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 10.0,
      //                 ),
      //                 Text(
      //                   // '$completedTaskCount of ${snapshot.data.length}',
      //                   'Total ${snapshot.data.length}',
      //                   style: GoogleFonts.prompt(
      //                     textStyle: TextStyle(
      //                         fontSize: 20.0, fontWeight: FontWeight.w500),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }
      //         return _buildProfile(snapshot.data[index - 1]);
      //       },
      //     );
      //   },
      // ),
    );
  }

  Row avatar(BuildContext context, int index) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.10,
          height: MediaQuery.of(context).size.height * 0.10,
          margin: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              // image: NetworkImage('${memberModels[index].image}'),
              image: AssetImage('images/${allProfiles[index].img}'),
            ),
            // child: new Image.asset('images/user.png'),
          ),
        ),
      ],
    );
  }

  Container formDetail(int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container(),
          Text(
            '${allProfiles[index].name}',
            // 'Name',
            style: GoogleFonts.prompt(fontSize: 14, color: Colors.black),
            //textAlign: TextAlign.left,
          ),
          Text(
            '${allProfiles[index].email}',
            // 'Name',
            style: GoogleFonts.prompt(fontSize: 14, color: Colors.black),
            //textAlign: TextAlign.left,
          ),
          Container(
            width: 200,
            child: Text(
              '${allProfiles[index].address}',
              // 'Name',
              style: GoogleFonts.prompt(fontSize: 14, color: Colors.black),
              //textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
