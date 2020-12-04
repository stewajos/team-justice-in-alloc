
import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/pages/report_page/widgets/selection_list_item.dart';
import 'package:flutter/material.dart';

class SelectionList extends StatefulWidget {

  final List<RecipientModel> items;

  SelectionList({
    @required this.items,
  });

  _SelectionListState createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList>{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index){
          var item = widget.items[index];
          return SelectionListItem(
            key: new Key(index.toString()),
            entry: item,
            itemList: widget.items,
          );
        }
    );
  }
}