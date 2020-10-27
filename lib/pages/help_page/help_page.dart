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

class HelpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = new TextEditingControlle r();
    // TextEditingController participantController = new TextEditingController();
    // TextEditingController supplyQuantController = new TextEditingController();


    return Scaffold(
     appBar: AppBar(
        title: Row(
          children: [
            Text("Help", style: TextStyle(fontSize: 20 ))
          ],
     ),
      ),
    body: Container(
        child: Column(
          children: [
            Text(
              "Patch Notes",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "FAQ",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
    ),

    // body: Container(
    //
    // ),
    //     color: Colors.white70,
    //     child: Stack(
    //       children: [
    //         Text("During this time of Covid-19 spreading around the world, we have seen unprecedented needs for scarce medical resources. It has been found that the most ethical way to handle this dillema is to allocate resources in a completely random way. This would be done to avoid any biases / transgressions that may fuel a person to supply these resources to one party over the other despite being in the same situations. Our initial audience is the medical field but the application of this could be used for many related situations."
    //          "")
    //
    //       ],
    //     )
     );
  }
}