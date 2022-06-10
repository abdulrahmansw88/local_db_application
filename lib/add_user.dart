import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_db_demo/db_helper.dart';

class AddUser extends StatefulWidget {
   AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final key = GlobalKey<FormState>();
  DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add user'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Name can\'t be null';
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: email,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Email can\'t be null';
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                  onPressed: (){
                    if( key.currentState!.validate()){
                      databaseHelper.insertUser(name.text.toString(), email.text.toString(), 1);
                    }else{}
                  },
                child: const Text(" ADD + "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
