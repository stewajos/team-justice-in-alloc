import 'package:flutter/material.dart';

class HistoryListItem extends StatelessWidget{
  final String listItem;

  HistoryListItem({
    @required this.listItem,
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListTile(
          title: Text(listItem, style: TextStyle(fontSize: 15,),),
        ),
      ),
    );
  }
}