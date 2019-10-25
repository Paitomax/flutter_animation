import 'package:equatable/equatable.dart';
import 'package:flutter_animation/src/home/models/list_item.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class LoadingHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<ListItem> items;

  HomeLoadedState(this.items);

  @override
  List<Object> get props => [items];
}
