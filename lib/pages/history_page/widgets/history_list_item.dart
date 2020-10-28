import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryListItem extends StatelessWidget{
  final String listItem;

  HistoryListItem({
    @required this.listItem,
  });



  @override
  Widget build(BuildContext context) {
    final allocationProvider = Provider.of<AllocationProvider>(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(listItem, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          subtitle: Text("Ran by: " + allocationProvider.state.savedEmail == "" ? "No Email Provided" : allocationProvider.state.savedEmail + "Hash Key: "),
        ),
      ),
    );
  }
}