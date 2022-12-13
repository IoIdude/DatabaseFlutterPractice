import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _userHomeState();
}

class _userHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            // color: Colors.black,
            // height: 45,
            child: Center(
              child: Text(
                "It's the user's page",
                style: TextStyle(
                    color: Colors.cyan.shade200,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
