import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  var msgtextcontroller = TextEditingController();
  String chatmsg;
  var fs = FirebaseFirestore.instance;

  var authc = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var signInUser = authc.currentUser.email;

    return Scaffold(
        appBar: AppBar(
          title: Text('Chat Here'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () async {
                  print("signoff");
                  await authc.signOut();
                  Navigator.pushNamed(context, "login");
                })
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/akshitiz99/kshitizflutter/master/Whatsapp-Wallpaper-072.jpg"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                builder: (context, snapshot) {
                  var msg = snapshot.data.docs;
                  List<Widget> y = [];
                  for (var d in msg) {
                    var msgText = d.data()['text'];
                    var msgSender = d.data()['sender'];
                    var msgWidget =
                        Text("msg: $msgText       from: $msgSender ");
                    y.add(msgWidget);
                  }
                  return Container(
                    child: Column(children: y),
                  );
                },
                stream: fs.collection("chat").snapshots(),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: devicewidth * 0.70,
                    child: TextField(
                      controller: msgtextcontroller,
                      onChanged: (value) {
                        chatmsg = value;
                      },
                    ),
                  ),
                  Container(
                    width: devicewidth * 0.30,
                    child: FlatButton(
                        onPressed: () async {
                          msgtextcontroller.clear();
                          await fs
                              .collection("chat")
                              .add({"text": chatmsg, "sender": signInUser});
                        },
                        child: Text("sent")),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
