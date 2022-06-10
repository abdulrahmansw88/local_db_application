import 'package:flutter/material.dart';
import 'package:local_db_demo/db_helper.dart';

class QueryScreen extends StatefulWidget {
  const QueryScreen({Key? key}) : super(key: key);

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  TextEditingController query = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Query"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: query,
                ),

                MaterialButton(
                  onPressed: (){
                    databaseHelper.query(query.text.toString());
                  },
                ),

                const SizedBox(height: 20),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    )
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
