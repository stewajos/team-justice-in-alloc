import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:allocation_app/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allocationProvider = Provider.of<AllocationProvider>(context);

    TextEditingController emailController = new TextEditingController();
    var emailInput;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 200),
              child: Text("Enter your email to get started", style: TextStyle(color: Colors.blue, fontSize: 20),),),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 70, right: 70, top: 20),
                  child: TextField(
                    autofocus: false,
                    controller: emailController,
                    inputFormatters: [],
                    decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3.0),
                    )),
                  ),
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: null,
              padding: EdgeInsets.all(30),
              child: Text("BACK", style: TextStyle(color: Colors.white, fontSize: 15),),
            ),
            Padding(padding: EdgeInsets.only(left: 80, right: 80)),
            FlatButton(onPressed:(){
              allocationProvider.state.userEmail = emailController.text;
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Scaffold(
                        body: NavigationDrawer()
                    );
                  }));
            },
                padding: EdgeInsets.all(30),
                child: Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 15),)),
          ],
        ),
      ),
    );
  }
}