import 'package:allocation_app/pages/history_page/widgets/history_list.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = new TextEditingController();
    // TextEditingController participantController = new TextEditingController();
    // TextEditingController supplyQuantController = new TextEditingController();


    return Container(
        color: Colors.white70,
        child: Scaffold(
          backgroundColor: Colors.black12,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBar(
              elevation: 3,
              centerTitle: true,
              leading: Container(),
              title: Text("Your History"), backgroundColor: Colors.blueAccent,
            ),
          ),
          body: Container(
            width: 1000,
            height: 1000,
            child: HistoryList(
              histList: ["#1231232 Test Item For History"], //ToDo: Add actual list of history loaded from device
            ),
          ),
        ),
    );
  }
}