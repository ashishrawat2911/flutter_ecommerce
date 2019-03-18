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
        children: <Widget>[
          Text("Category"),
          Text("List Item"),
          GridView.count(
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: <Widget>[
              const Text('He\'d have you all unravel at the'),
              const Text('Heed not the rabble'),
              const Text('Sound of screams but the'),
              const Text('Who scream'),
              const Text('Revolution is coming...'),
              const Text('Revolution, they...'),
            ],
          ),
          Text("List Item"),
          Text("List Item"),
          Text("List Item"),
          Text("List Item"),
          Text("List Item"),
          Text("List Item"),
          Text("List Item"),
          Text("List Item"),
        ],
      ),
    );
  }
}
