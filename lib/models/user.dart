// ignore_for_file: non_constant_identifier_names

class MyUser {
  MyUser({
    required this.Name,
    required this.time,
  });
  late final String Name;
  late final String time;

  String getname() {
    return Name + time + DateTime.now().toString() ;
  }

  MyUser.fromJson(Map<dynamic, dynamic> json) {
    Name = json['Name'];
    time = json['time'];
  }



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Name'] = Name;
    _data['time'] = time;
    return _data;
  }
}
