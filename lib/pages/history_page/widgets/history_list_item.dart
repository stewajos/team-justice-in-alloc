import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/pages/history_page/widgets/selected_list.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

class HistoryListItem extends StatelessWidget{
  final ResultModel listItem;

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
          contentPadding: EdgeInsets.all(15),
          title: Text(listItem.timestamp, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          subtitle: Text("HashKey: " + listItem.hashKey + "\n" + "Email: " + listItem.email),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
          onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  contentPadding: EdgeInsets.all(10),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Selected Values (${listItem.selection.length} Recipients)", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Container(
                        width: 1000,
                        height: 500,
                        child: SelectedList(values: listItem.selection),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      FlatButton(
                        child: Text("Back", style: TextStyle(color: Colors.white),),
                        color: primaryColor,
                        minWidth: 1000,
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      )
                    ],
                  ),
                );
              }
            );
          },
        ),
      ),
    );
  }
}