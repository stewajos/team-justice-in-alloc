import 'package:allocation_app/pages/history_page/widgets/history_list.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class HistoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final allocationProvider = Provider.of<AllocationProvider>(context);

    return Container(
        color: Colors.white70,
        child: Scaffold(
          backgroundColor: Colors.black12,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
              elevation: 4,
              centerTitle: true,
              leading: Container(),
              title: Text("\n" + "Your History"), backgroundColor: primaryColor,
            ),
          ),
          body: Container(
            width: 1000,
            height: 1000,
            child: HistoryList(
              histList: allocationProvider.state.allocHistList != null ? allocationProvider.state.allocHistList : [],
            ),
          ),
        ),
    );
  }
}