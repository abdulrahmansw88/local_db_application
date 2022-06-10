import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_db_demo/db_helper.dart';

class AddBook extends StatefulWidget {
   AddBook({Key? key}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final key = GlobalKey<FormState>();
DatabaseHelper databaseHelper = DatabaseHelper();

  TextEditingController userID = TextEditingController();
  TextEditingController bookName = TextEditingController();

  TextEditingController finishDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Books '),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: userID,
                validator: (value){
                  if(value!.isEmpty){
                    return 'User id can\'t be null';
                  }
                },
                decoration: const InputDecoration(
                  hintText: "User ID",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: bookName,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Book Name can\'t be null';
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Book Name",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: finishDate,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Finish Date can\'t be null';
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Finish Date",
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async{
                  // databaseHelper.insert(tableName, title, descrption, priority)

                  if( key.currentState!.validate()){
                    // databaseHelper.getIDFromName("Tahir Raza");
                    databaseHelper.insertBook(await databaseHelper.getIDFromName(userID.text.toString()), bookName.text, finishDate.text.toString());
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
