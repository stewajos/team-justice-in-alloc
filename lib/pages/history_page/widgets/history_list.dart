import 'package:allocation_app/model/result_model.dart';
import 'package:flutter/cupertino.dart';

import 'history_list_item.dart';

class HistoryList extends StatefulWidget{

  _HistoryListState createState() => _HistoryListState();

  final List<String> histList;

  HistoryList({
   @required this.histList,
  });

}

class _HistoryListState extends State<HistoryList>{

  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(2),
        itemCount: widget.histList.length,
        itemBuilder: (context, index){
          var item = widget.histList[index];
          return HistoryListItem(
            listItem: item,
          );
        }
    );
  }
}