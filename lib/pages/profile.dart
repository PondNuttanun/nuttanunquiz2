import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterrestapimysql/pages/edituser2.dart';
import 'package:flutterrestapimysql/pages/user.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  final String username;
  final String fullname;
  final String password;

  const Profile({
    required this.username,
    required this.fullname,
    required this.password,
  });

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'บัญชีผู้ใช้',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.edit,size: 50,),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => EditUser2(
                      //       // users: users,
                      //       // index: index,
                      //     ),
                      //   ),
                      // );
                      // debugPrint('Edit Clicked');
                    },
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Text(
                        '${widget.username}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.fullname}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
