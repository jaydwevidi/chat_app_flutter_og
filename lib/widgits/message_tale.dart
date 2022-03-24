// ignore_for_file: prefer_const_constructors

import 'package:chat_app_flutter_og/models/message_x.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final XMessage message;
  const MessageTile({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState(message);
}

class _MessageTileState extends State<MessageTile> {
  XMessage messagex;

  _MessageTileState(this.messagex);
  @override
  Widget build(BuildContext context) {
    if (messagex.senderID == "jayraj1999") {
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
                        child: Text(messagex.body,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textScaleFactor:
                                double.parse(messagex.textScaling)),
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
                              messagex.timeText,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Icon(
                              Icons.check,
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
                        messagex.body,
                        textScaleFactor: double.parse(messagex.textScaling),
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
                            messagex.timeText,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Icon(
                            Icons.check,
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
  }
}
