import 'package:flutter/material.dart';
import 'package:social_network/widget/header.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: header(context,titleText: "Profile",),
      body: Text('Profile'),
    );
  }
}