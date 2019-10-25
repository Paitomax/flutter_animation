import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/src/home/models/list_item.dart';

class AnotherPage extends StatefulWidget {
  final ListItem item;

  const AnotherPage({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnotherPageState();
  }
}

class AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: Hero(tag: widget.item.title, child: Container(color: widget.item.backgroundColor,)),
    );
  }
}
