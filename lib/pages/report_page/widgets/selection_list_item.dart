import 'package:allocation_app/model/recipient_model.dart';
import 'package:flutter/material.dart';

class SelectionListItem extends StatelessWidget {

  final RecipientModel entry;
  final List<RecipientModel> itemList;

  SelectionListItem({
    Key key,
    @required this.entry,
    @required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListTile(
          title: Text(entry.id, style: TextStyle(fontSize: 15,),),
        ),
      ),
    );
  }
}