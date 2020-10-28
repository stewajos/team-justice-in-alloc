import 'package:allocation_app/model/result_model.dart';
import 'package:flutter/material.dart';

class HistoryListItem extends StatelessWidget{
  final ResultModel listItem;

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
          title: Text(listItem.timestamp, style: TextStyle(fontSize: 15,),),
        ),
      ),
    );
  }
}