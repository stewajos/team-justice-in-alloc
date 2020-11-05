import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/pages/history_page/widgets/selected_list.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedListItem extends StatelessWidget{
  var listItem;

  SelectedListItem({
    @required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(listItem, style: TextStyle(fontSize: 15),),
        ),
      ),
    );
  }
}