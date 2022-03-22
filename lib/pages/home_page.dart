// ignore_for_file: prefer_const_constructors, dead_code, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:chat_app_flutter_og/models/user.dart';
import 'package:chat_app_flutter_og/widgits/chat_tile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.deepPurple,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromARGB(255, 165, 165, 165),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Chats",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: "Calls",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ]),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Chats"),
          actions: [
            // Navigate to the Search Screen
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
        drawer: Drawer(),
        body: ListView.builder(
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return ChatTile(index: index);
          },
        ),
        floatingActionButton: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 94, 0, 0).withOpacity(0.4),
                    offset: Offset(2, 3),
                    blurRadius: 5)
              ],
            ),
            child: IconButton(
                onPressed: () {
                  log("clicked");
                  final mref = FirebaseDatabase.instance.ref("chats");
                  

                  //mref.set(MyUser(Name: "Name", time: "444").toJson(),);

                  mref.onValue.listen((event) {
                    
                    var todo = event.snapshot;
                    final json = todo.value as Map<dynamic, dynamic>;
                    MyUser message = MyUser.fromJson(json);
                    log(message.getname());
                    setState(() {});
                  });
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
          ),
        ));
  }
}
