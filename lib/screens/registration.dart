import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;
  String _email;
  String _password;
  bool spin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '𝓐𝖉𝖉 𝖀𝖘𝖊𝖗..',
            style: TextStyle(),
          ),
          backgroundColor: Colors.black87,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.camera_alt), onPressed: null)
          ]),
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/akshitiz99/kshitizflutter/master/Screenshot_2021-01-11-00-27-14-73.jpg"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _email = value;
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white70,
                    decoration: InputDecoration(
                        hintText: "enter email",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                        ),
                        fillColor: Colors.white60,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      _password = value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "enter strong password",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black)),
                    color: Colors.brown.withOpacity(0.02),
                    child: Text(
                      '𝕽𝖊𝖌𝖎𝖘𝖙𝖊𝖗',
                      style: TextStyle(color: Colors.white70),
                    ),
                    onPressed: () async {
                      setState(() {
                        spin = true;
                      });

                      try {
                        var user = await authc.createUserWithEmailAndPassword(
                          email: _email.trim(),
                          password: _password,
                        );
                        print(user);
                        if (user.additionalUserInfo.isNewUser == true) {
                          Navigator.pushNamed(context, "chat");
                          setState(() {
                            spin = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
