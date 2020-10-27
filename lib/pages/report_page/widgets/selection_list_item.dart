import 'package:flutter/material.dart';

class SelectionListItem extends StatelessWidget {

  final String entry;
  final List<String> itemList;

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
          title: Text(entry, style: TextStyle(fontSize: 15,),),
        ),
      ),
    );
  }
}