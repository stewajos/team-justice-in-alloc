import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/pages/history_page/widgets/selected_list_item.dart';
import 'package:flutter/material.dart';

import 'history_list_item.dart';

class SelectedList extends StatelessWidget{

  var values;

  SelectedList({@required this.values,});


  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(2),
        itemCount: values.length,
        itemBuilder: (context, index){
          var item = values[index];
          return SelectedListItem(
            listItem: item,
          );
        }
    );
  }
}