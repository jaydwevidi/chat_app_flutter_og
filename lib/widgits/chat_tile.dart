// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'dart:developer';

import 'package:flutter/material.dart';

class ChatTile extends StatefulWidget {
  final int index;
  const ChatTile({Key? key, required this.index}) : super(key: key);

  @override
  State<ChatTile> createState() => _ChatTileState(index);
}

class _ChatTileState extends State<ChatTile> {
  final int index;

  _ChatTileState(this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("message");
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(2),
              decoration: (index % 2 == 0)
                  ? BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      // shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://www.dccomics.com/sites/default/files/field/image/DentTragedy_blog_611b24927f9810.08060226.jpg"),
              ),
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Harvey Dent",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              index % 3 == 0
                                  ? Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Container(
                                      child: null,
                                    ),
                            ],
                          ),
                          Text(
                            "03:23 AM",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Lets Flip a coin to see Falconie's fate.If it is heads then I burn the cash or else I call Gordon , Falconi goes to prison.Lets Flip a coin to see Falconie's fate.If it is heads then I burn the cash or else I call Gordon , Falconi goes to prison.Lets Flip a coin to see Falconie's fate.If it is heads then I burn the cash or else I call Gordon , Falconi goes to prison.Lets Flip a coin to see Falconie's fate.If it is heads then I burn the cash or else I call Gordon , Falconi goes to prison.Lets Flip a coin to see Falconie's fate.If it is heads then I burn the cash or else I call Gordon , Falconi goes to prison",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
