class ProfileModel {
  int id;
  String name;
  String email;
  DateTime date;
  String address;
  String img;

  ProfileModel({this.name,this.email, this.date, this.address,this.img});
  ProfileModel.withId({this.id, this.name, this.email, this.date, this.address,this.img});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['id'] = id;
    map['name'] = name;
    map['date'] = date.toIso8601String();
    map['address'] = address;
    map['img'] = img;
    return map;
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel.withId(
      id: map['id'],
      name: map['name'],
      date: DateTime.parse(map['date']),
      address: map['address'],
      img: map['img'],
    );
  }
}
