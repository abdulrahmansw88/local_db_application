import 'package:flutter/material.dart';
import 'package:local_db_demo/add_user.dart';
import 'package:local_db_demo/add_user_book.dart';
import 'package:local_db_demo/db_helper.dart';
import 'package:local_db_demo/query_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: 'Home',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: (){

                databaseHelper.initializeDatabase();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddUser()));
              },

              //gfhfghf
              child: const Text("Add User"),
            ),
            MaterialButton(
              onPressed: (){
                databaseHelper.initializeDatabase();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddBook()));
                // databaseHelper.createTable(databaseHelper.database);
              },
              child: const Text("Add Book"),
            ),
            MaterialButton(
              onPressed: (){
                databaseHelper.initializeDatabase();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const QueryScreen()));
              },
              child: const Text("SQL Query"),
            ),
          ],
        ),
      ),
    );
  }
}