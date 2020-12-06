import 'package:allocation_app/pages/email_entry_page/email_entry_page.dart';
import 'package:allocation_app/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allocProviders,
      child: MaterialApp(
        title: 'Project Alek',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override void initState() {
    // TODO: implement initState
    Firebase.initializeApp();
    print("we made it to init state");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EmailEntryPage();
  }
}
