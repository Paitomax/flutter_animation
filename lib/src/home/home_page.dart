import 'package:flutter/material.dart';
import 'package:flutter_animation/src/another_page/another_page.dart';
import 'package:flutter_animation/src/home/home_bloc.dart';
import 'package:flutter_animation/src/home/home_event.dart';
import 'package:flutter_animation/src/home/home_state.dart';
import 'package:flutter_animation/src/home/models/list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchListItem());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          builder: (context) => _bloc,
          child: BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                if (state is LoadingHomeState) {
                  return _buildCircularProgress();
                } else {
                  return Center(
                      child: _buildList((state as HomeLoadedState).items));
                }
              }),
        ),
      ),
    );
  }

  Widget _buildCircularProgress() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildList(List<ListItem> items) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildListItem(items[index]);
        },
      ),
    );
  }

  Widget _buildListItem(ListItem item) {
    return Hero(
      tag: item.title,
      transitionOnUserGestures: true,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AnotherPage(item: item);
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              color: item.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.only(right: 8.0),
          alignment: Alignment.bottomLeft,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.title,
              style: TextStyle(
                color: item.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
