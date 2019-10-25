import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final Color backgroundColor;
  final Color textColor;

  ListItem(this.title,
      {this.backgroundColor = Colors.black, this.textColor = Colors.white});
}
