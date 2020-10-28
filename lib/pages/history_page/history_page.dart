import 'package:allocation_app/pages/history_page/widgets/history_list.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final allocationProvider = Provider.of<AllocationProvider>(context);
    allocationProvider.getHistory();

    return Container(
        color: Colors.white70,
        child: Scaffold(
          backgroundColor: Colors.black12,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
              elevation: 3,
              centerTitle: true,
              leading: Container(),
              title: Text("\n" + "Your History"), backgroundColor: Colors.blueAccent,
            ),
          ),
          body: Container(
            width: 1000,
            height: 1000,
            child: HistoryList(
              histList: allocationProvider.state.strHistList != null ? allocationProvider.state.strHistList : [],
            ),
          ),
        ),
    );
  }
}