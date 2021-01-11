import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '𝕮𝖍𝖆𝖙 𝕽𝖔𝖔𝖒...',
            style: TextStyle(),
          ),
          backgroundColor: Colors.orange,
          // Set any color .of status bar you want; or it defaults to your theme's primary color

          actions: <Widget>[
            IconButton(icon: Icon(Icons.mail), onPressed: null)
          ]),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://raw.githubusercontent.com/akshitiz99/kshitizflutter/master/Screenshot_2021-01-10-23-36-59-74.jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black)),
                color: Colors.black.withOpacity(0.05),
                child: Text(
                  '𝖗𝖊𝖌𝖎𝖘𝖙𝖊𝖗',
                  style: TextStyle(color: Colors.white70),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "reg");
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black)),
                color: Colors.brown.withOpacity(0.02),
                child: Text(
                  '𝖑𝖔𝖌𝖎𝖓',
                  style: TextStyle(color: Colors.white70),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
