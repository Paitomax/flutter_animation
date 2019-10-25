import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/src/home/models/list_item.dart';

class ItemDetailPage extends StatefulWidget {
  final ListItem item;

  const ItemDetailPage({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ItemDetailPageState();
  }
}

class ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: widget.item.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.8,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  title: Text(widget.item.title,
                      style: TextStyle(
                        color: widget.item.textColor,
                        fontSize: 16.0,
                      )),
                  background: Hero(
                      tag: widget.item.title,
                      child: Container(
                        decoration: BoxDecoration(
                            color: widget.item.backgroundColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            )),
                      ))),
            ),
          ];
        },
        body: Center(
          child: Text("Sei de nada"),
        ),
      ),
    );
  }
}
