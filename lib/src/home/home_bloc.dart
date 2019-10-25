import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './bloc.dart';
import 'models/list_item.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => LoadingHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchListItem) {
      yield* _mapFetchListItemToState();
    }
  }

  Stream<HomeState> _mapFetchListItemToState() async* {
    if (this.state is! LoadingHomeState) yield LoadingHomeState();
    await Future.delayed(Duration(seconds: 2));
    yield HomeLoadedState(_fetchListItem());
  }

  List<ListItem> _fetchListItem() {
    List<ListItem> list = List<ListItem>();
    list.add(ListItem("Item 1"));
    list.add(ListItem("Item 2", backgroundColor: Colors.purple));
    list.add(ListItem("Item 3", backgroundColor: Colors.blue));
    list.add(ListItem("Item 4", backgroundColor: Colors.red));
    list.add(ListItem("Item 5", backgroundColor: Colors.brown));
    list.add(ListItem("Item 6", backgroundColor: Colors.purple));
    list.add(ListItem("Item 7", backgroundColor: Colors.blue));
    list.add(ListItem("Item 8", backgroundColor: Colors.red));
    return list;
  }
}
