import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:allocation_app/pages/allocation_page/widgets/allocation_list.dart';
import 'package:allocation_app/model/recipient_model.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:provider/provider.dart';
//import 'package:allocation_app/model/result_model.dart';
import 'package:allocation_app/pages/report_page/report_page.dart';
import 'package:allocation_app/services/database.dart';
//import 'package:allocation_app/services/result_mapper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class HelpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = new TextEditingController();
    // TextEditingController participantController = new TextEditingController();
    // TextEditingController supplyQuantController = new TextEditingController();


    return Scaffold(
     appBar: PreferredSize(
       preferredSize: Size.fromHeight(80),
       child: AppBar(
         leading: Container(),
         elevation: 3,
         backgroundColor: primaryColor,
         title: Text("\n" + "Help", style: TextStyle(fontSize: 20 )),
         centerTitle: true,
      )),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              "Patch Notes",
          textAlign: TextAlign.center,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              ),
            ),

            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text('FAQ'),
                    subtitle: Text('This is where the questions reside'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('More Questions'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Ask'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

      ),

     );
  }
}