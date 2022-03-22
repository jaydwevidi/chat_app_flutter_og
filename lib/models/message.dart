class Message {
  Message({
    required this.Name,
    required this.timee,
    required this.sender,
  });
  late final String Name;
  late final String timee;
  late final bool sender;
  
  Message.fromJson(Map<String, dynamic> json){
    Name = json['Name'];
    timee = json['timee'];
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Name'] = Name;
    _data['timee'] = timee;
    _data['sender'] = sender;
    return _data;
  }
}