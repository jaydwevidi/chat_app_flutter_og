// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:chat_app_flutter_og/models/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var chat = "";
  var temp = <Message>[
    Message(
        Name: "Naasd  dfasdfas das d as me", timee: "11:27 AM", sender: true),
    Message(Name: "Nadfas dasdf me", timee: "11:27 AM", sender: false),
    Message(Name: "Naa sdfas df asdf asdf e", timee: "11:27 AM", sender: true),
    Message(Name: "Naas dfaswqecd me", timee: "11:27 AM", sender: true),
    Message(
        Name: "Nam asdfaqwerqcwer qfqefsdss de",
        timee: "11:27 AM",
        sender: false),
    Message(Name: "Naa sdfawercae sdme", timee: "11:27 AM", sender: true),
    Message(Name: "Nam asdefawevrfsdfafa sde", timee: "11:27 AM", sender: true),
    Message(
        Name: "Naasf asdf av dgsdfsdg sd gfsd fg sdf",
        timee: "11:27 AM",
        sender: false),
    Message(Name: "Naas dfafasdfasdfsd me", timee: "11:27 AM", sender: false),
    Message(Name: "Nam aerwsdfas de", timee: "11:27 AM", sender: false),
    Message(Name: "Naa sdfasf sdme", timee: "11:27 AM", sender: true),
    Message(Name: "Nam asdfa sde", timee: "11:27 AM", sender: true),
    Message(Name: "Naasf asdf me", timee: "11:27 AM", sender: false),
    Message(
        Name:
            "Nam fasdf asdfas asdfas dfasdfas  234 345ewrggdfg sdfg dfg sdfg sdfgsdfgsdf gsd sdfge",
        timee: "11:27 AM",
        sender: true),
  ];
  final url =
      "https://www.dccomics.com/sites/default/files/field/image/DentTragedy_blog_611b24927f9810.08060226.jpg";
  late List<Message> messages;

  @override
  void initState() {
    messages = List.from(temp.reversed);
    super.initState();
  }

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.videocam,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
            ),
          ),
        ],
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(url, scale: 1.5),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harvey Dent",
                  style: TextStyle(),
                ),
                Text(
                  "Last Seen : 16:32",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
