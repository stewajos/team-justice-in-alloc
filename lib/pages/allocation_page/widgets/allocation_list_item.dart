import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllocationListItem extends StatelessWidget {

  final RecipientModel entry;
  final List<RecipientModel> itemList;

  AllocationListItem({
    Key key,
    @required this.entry,
    @required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allocationProvider = Provider.of<AllocationProvider>(context);

    return Card(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      elevation: 3,
      color: Colors.white60,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: ListTile(
          title: Text(entry.id, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          trailing: FlatButton(
            padding: EdgeInsets.only(left:50),
            child: Icon(Icons.delete_outline, color: Colors.black,),
            onPressed: (){
              allocationProvider.deleteListItem(entry);
            },
          ),
        ),
      ),
    );
  }
}