import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Forms() // Spacer
          ],
        ),
      ),
    );
  }
}

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _idTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    _idTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _idTextEditingController,
            decoration: InputDecoration(
              labelText: "ログイン ID",
              hintText: "ログイン ID"
            ),
          ),
          SizedBox(height: 8.0), // Spacer
          TextField(
            controller: _passwordTextEditingController,
            decoration: InputDecoration(
              labelText: "パスワード",
              hintText: "パスワード"
            ),
          ),
          SizedBox(height: 24.0), // Spacer
          FlatButton(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Text("ログイン", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(
                      "ログインID: ${_idTextEditingController.text}\n"
                      "パスワード: ${_passwordTextEditingController.text}"
                    ),
                  );
                }
              );
            },
          )
        ],
      ),
    );
  }
}