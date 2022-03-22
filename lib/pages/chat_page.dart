// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:chat_app_flutter_og/models/message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var temp = <Message>[
    Message(Name: "Naasd  dfasdfas das d as me", timee: "timee", sender: true),
    Message(Name: "Nadfas dasdf me", timee: "timee", sender: false),
    Message(Name: "Naa sdfas df asdf asdf e", timee: "timee", sender: true),
    Message(Name: "Naas dfaswqecd me", timee: "timee", sender: true),
    Message(
        Name: "Nam asdfaqwerqcwer qfqefsdss de", timee: "timee", sender: false),
    Message(Name: "Naa sdfawercae sdme", timee: "timee", sender: true),
    Message(Name: "Nam asdefawevrfsdfafa sde", timee: "timee", sender: true),
    Message(
        Name: "Naasf asdf av dgsdfsdg sd gfsd fg sdf",
        timee: "timee",
        sender: false),
    Message(Name: "Naas dfafasdfasdfsd me", timee: "timee", sender: false),
    Message(Name: "Nam aerwsdfas de", timee: "timee", sender: false),
    Message(Name: "Naa sdfasf sdme", timee: "timee", sender: true),
    Message(Name: "Nam asdfa sde", timee: "timee", sender: true),
    Message(Name: "Naasf asdf me", timee: "timee", sender: false),
    Message(
        Name:
            "Nam fasdf asdfas asdfas dfasdfas  234 345ewrggdfg sdfg dfg sdfg sdfgsdfgsdf gsd sdfge",
        timee: "timee",
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
                  "Last Seen : 14:32",
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
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              if (messages[index].sender) {
                return Row(
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue,
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  messages[index].Name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '11:27 PM',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                );
              } else {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.purple,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                messages[index].Name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '12:43 AM',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                );
              }
            },
          )),
          SafeArea(
            child: Container(
                padding: EdgeInsets.all(10),
                height: 70,
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.red,
                  child: TextFormField(),
                )),
          ),
        ],
      ),
    );
  }
}
