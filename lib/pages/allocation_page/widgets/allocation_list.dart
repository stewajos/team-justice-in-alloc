import 'package:allocation_app/pages/allocation_page/widgets/allocation_list_item.dart';
import 'package:flutter/material.dart';

class AllocationList extends StatefulWidget {

  final List<String> items;

  AllocationList({
    @required this.items,
  });

  _AllocationListState createState() => _AllocationListState();
}

class _AllocationListState extends State<AllocationList>{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index){
          var item = widget.items[index];
          return AllocationListItem(
            key: new Key(index.toString()),
            entry: item,
            itemList: widget.items,
            onDelete: () => _deleteItem(index),
          );
        }
    );
  }

  void _deleteItem(int index){
    setState(() {
      if(index >= 0){
        widget.items.removeAt(index);
      }
    });
  }
}