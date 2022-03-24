// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'dart:developer';

import 'package:chat_app_flutter_og/models/message_x.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var chat = "";
  var chatScale = 1.0;
  var isSwitched = false;
  var lastMessageID = 0;
  var messages = <XMessage>[];
  var backgroundURL =
      "https://www.dccomics.com/sites/default/files/field/image/DentTragedy_blog_611b24927f9810.08060226.jpg";

  var wallpaper =
      "https://wallpapers.ispazio.net/wp-content/uploads/2020/03/IMG_3403.jpg";
  void initState() {
    super.initState();
    getMessages();
  }

  void getMessages() {
    messages.add(createMessage());

    FirebaseDatabase.instance
        .ref()
        .child("chats")
        .child("jayraj1999rajd2234")
        .child("wallpaper")
        .onValue
        .listen((event) {
      wallpaper = event.snapshot.value.toString();
      log(backgroundURL);
      setState(() {});
    });

    final dbRef = FirebaseDatabase.instance
        .ref()
        .child("chatMessages")
        .child("jayraj1999rajd2234");

    dbRef.onValue.listen((event) {
      messages.clear();
      var todo = event.snapshot.children;
      log(todo.first.value.toString());
      for (var ii in todo) {
        final key = ii.key.toString();
        final json = ii.value as Map<dynamic, dynamic>;
        XMessage message = XMessage.fromJson(json);

        lastMessageID = int.parse(key);
        log("message = $message");

        if (message.receiverID == "jayraj1999" && message.seen == false) {
          message.seen = true;
          message.seentime = DateTime.now().toString();
        }
        dbRef.child(key).set(message);

        setState(() {
          messages.insert(0, message);
        });
      }
    });
  }

  void addMessage() {
    lastMessageID++;
    final dbRef = FirebaseDatabase.instance
        .ref()
        .child("chatMessages")
        .child("jayraj1999rajd2234")
        .child("$lastMessageID");

    dbRef.set(createMessage().toJson());

    addLastMessage();
  }

  void addLastMessage() {
    final dbRef = FirebaseDatabase.instance
        .ref()
        .child("chats")
        .child("jayraj1999rajd2234")
        .child("lastMessage");

    dbRef.set(createMessage().toJson());
  }

  XMessage createMessage() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('hh:mm a').format(now);

    return XMessage(
        body: chat,
        datetime: now.toString(),
        edited: false,
        receiverID: isSwitched ? "rajd2234" : "jayraj1999",
        seen: false,
        seentime: "NA",
        senderID: isSwitched ? "jayraj1999" : "rajd2234",
        textScaling: chatScale.toString(),
        timeText: formattedDate,
        type: "1");
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
              backgroundImage: NetworkImage(backgroundURL, scale: 1.5),
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
            ),
            SizedBox(
              width: 20,
            ),
            CupertinoSwitch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(wallpaper),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                if (messages[index].senderID == "jayraj1999") {
                  return Row(
                    children: [
                      Expanded(child: Container()),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 250,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.blue,
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(messages[index].body,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        textScaleFactor: double.parse(
                                            messages[index].textScaling)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Text(
                                          messages[index].timeText,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Icon(
                                          messages[index].seen
                                              ? Icons.done_all
                                              : Icons.check,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ),
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
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 250,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.redAccent,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    messages[index].body,
                                    textScaleFactor: double.parse(
                                        messages[index].textScaling),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 70,
                                  child: Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Text(
                                        messages[index].timeText,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      Icon(
                                        messages[index].seen
                                            ? Icons.done_all
                                            : Icons.check,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
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
            Slider(
                value: chatScale,
                min: 0.1,
                max: 5.0,
                onChanged: (change) {
                  chatScale = change;
                  setState(() {});
                }),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                    color: Color.fromARGB(255, 68, 91, 102),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 7, 55, 94).withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                      )
                    ]),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.emoji_emotions_outlined,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 7,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintText: "Send Message",
                            ),
                            onChanged: (value) {
                              chat = value;
                            },
                            controller: fieldText,
                          ))
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (chat.isNotEmpty) {
                        addMessage();
                        chat = "";
                        chatScale = 1.0;
                        setState(() {
                          clearText();
                        });
                      } else {
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
