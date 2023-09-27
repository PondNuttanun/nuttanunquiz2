import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class EditUser2 extends StatefulWidget {
  final List users;
  final int index;

  const EditUser2({
    Key? key,
    required this.users,
    required this.index,
  }) : super(key: key);

  @override
  State<EditUser2> createState() => _EditUser2State();
}

class _EditUser2State extends State<EditUser2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController pwd = TextEditingController();

  Future<void> editUser() async {
    try {
      String urlstr = 'http://172.21.236.224/addressbook/edit.php';

      final url = Uri.parse(urlstr);
      final response = await http.post(
        url,
        body: {
          'username': user.text,
          'password': pwd.text,
          'fullname': fullname.text,
        },
      );

      if (response.statusCode == 200) {
        final json = response.body;
        final data = jsonDecode(json);
        debugPrint('Data: $data');
        if (data == 'Success') {
          print('Result: $data');
          setState(() {
            Navigator.pushNamed(context, '/home');
          });
        } else {
          Fluttertoast.showToast(
              msg: "Something went wrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.purple,
              textColor: Colors.white,
              fontSize: 16.0);
          print('Result: $data');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
      // Handle the error, e.g., display an error message
    }
  }

  @override
  void initState() {
    super.initState();
    // editMode = true;
    fullname.text = widget.users[widget.index]['fullname'];
    user.text = widget.users[widget.index]['username'];
    pwd.text = widget.users[widget.index]['password'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text('Edit User Form',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: fullname,
                decoration: const InputDecoration(
                  labelText: 'Fullname',
                  hintText: 'Please input fullname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fullname';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: user,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Please input username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: pwd,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Please input password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        editUser();
                      }
                    },
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Cancel'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
