import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[listViewItem(), listViewItem(), listViewItem()],
      ),
    );
  }

  Widget listViewItem() {
    return Card(
      child: Container(
        decoration: BoxDecoration(),
        height: MediaQuery.of(context).size.height / 3,
        child: Image.network(
            "https://cdn.dribbble.com/users/172256/screenshots/672295/entry13.jpg"),
      ),
    );
  }
}
