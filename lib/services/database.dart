import 'package:cloud_firestore/cloud_firestore.dart';

//we dont need this right now, and it's causing web deploy problems

class DatabaseService {
  // final String testingID; //in the future we are going to pass in this var in the Database Services instance
  // DatabaseService ({ this.testingID });

  // collection reference
  final CollectionReference testingCollection =
      FirebaseFirestore.instance.collection('testing');
  final CollectionReference databaseCollection =
      FirebaseFirestore.instance.collection('database');
  final CollectionReference faqCollection =
      FirebaseFirestore.instance.collection('FAQ');

  Future updateCount() async {
    return await testingCollection
        .doc("target")
        .update({"count": FieldValue.increment(1)});
  }

  Future getFAQ() async {
    var snapshot = await faqCollection.get();
    return snapshot.docs.map((doc) => doc.data());
  }

  Future sendResult(recipients, supply, timestamp, selection, hash) async {
    return await databaseCollection.doc().set({
      "recipients": recipients,
      "supply": supply,
      "timestamp": timestamp,
      "selection": selection,
      "hash": hash
    });
  }
}


