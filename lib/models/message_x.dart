class XMessage {
  XMessage({
    required this.body,
    required this.datetime,
    required this.edited,
    required this.receiverID,
    required this.seen,
    required this.seentime,
    required this.senderID,
    required this.textScaling,
    required this.timeText,
    required this.type,
    required this.refKey,
  });
  late final String body;
  late final String refKey;
  late final String datetime;
  late final bool edited;
  late final String receiverID;
  late bool seen;
  late String seentime;
  late final String senderID;
  late final String textScaling;
  late final String timeText;
  late final String type;

  XMessage.fromJson(Map<dynamic, dynamic> json) {
    body = json['body'];
    datetime = json['datetime'];
    edited = json['edited'];
    receiverID = json['receiverID'];
    seen = json['seen'];
    seentime = json['seentime'];
    senderID = json['senderID'];
    textScaling = json['textScaling'];
    timeText = json['timeText'];
    type = json['type'];
    refKey = json['refKey'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['body'] = body;
    _data['datetime'] = datetime;
    _data['edited'] = edited;
    _data['receiverID'] = receiverID;
    _data['seen'] = seen;
    _data['seentime'] = seentime;
    _data['senderID'] = senderID;
    _data['textScaling'] = textScaling;
    _data['timeText'] = timeText;
    _data['type'] = type;
    _data['refKey'] = refKey;
    return _data;
  }

  String toStr() {
    return body + datetime;
  }
}
