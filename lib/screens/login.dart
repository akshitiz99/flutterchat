import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var authc = FirebaseAuth.instance;
  String _email;
  String _password;
  bool spin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '𝓛𝖔𝖌𝖎𝖓 𝕮𝖊𝖉𝖊𝖓𝖙𝖎𝖆𝖑𝖘...',
          style: TextStyle(),
        ),
        backgroundColor: Colors.black87,
      ),
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/akshitiz99/kshitizflutter/master/Screenshot_2021-01-11-00-29-58-45.jpg"),
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
                    decoration: InputDecoration(
                        hintText: "enter ur email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: InputDecoration(
                        hintText: "remember ur psswd",
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
                      '𝕷𝖔𝖌𝖎𝖓',
                      style: TextStyle(color: Colors.white70),
                    ),
                    onPressed: () async {
                      setState(() {
                        spin = true;
                      });

                      try {
                        var usersign = await authc.signInWithEmailAndPassword(
                          email: _email.trim(),
                          password: _password,
                        );
                        print(usersign);
                        if (usersign != null) {
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
