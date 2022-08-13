
// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(String email, password) async {
   try {
     Response response = await post(
       Uri.parse("https://reqres.in/api/login"),
       body: {
         'email' : email,
         'password' : password
       }
     );
     if(response.statusCode == 200){
       var data = jsonDecode(response.body.toString());
       print(data['token']);
       print("Login successful.");
     }
     else{
       print("Login failed.");
     }
   } catch (e) {
     print(e.toString());
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Api"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Email"
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Password"
              ),
            ),
             SizedBox(height: 40.0),
            GestureDetector(
              onTap: (){
                login(email.text.toString(), password.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Center(child: Text("Sign Up"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}