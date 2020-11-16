import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:allocation_app/theme.dart';
import 'package:allocation_app/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailEntryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmailEntryPageState();
  }
}

class EmailEntryPageState extends State<EmailEntryPage> {

  final _formKey = GlobalKey<FormState>();


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
              child: Text("Enter your email to get started", style: TextStyle(color: primaryColor, fontSize: 20),),),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 70, right: 70, top: 20),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      autofocus: false,
                      controller: emailController,
                      validator: (value) {
                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                          return 'Invalid Email';
                        }
                      return null;
                      },
                      inputFormatters: [],
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 3.0),
                        )
                      ),
                    )
                  )

                )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed:(){
                if(_formKey.currentState.validate()) {
                  allocationProvider.state.userEmail = emailController.text;
                  allocationProvider.getHistory();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Scaffold(
                          body: NavigationDrawer()
                      );
                    })
                  );
                }
              },
              padding: EdgeInsets.all(30),
              child: Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ),
          ],
        ),
      ),
    );
  }
}