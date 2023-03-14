import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  /// function to add data to server by making files on servers
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection("blogs")
        .add(blogData)
        .catchError((e) {
      print(e);
    });
  }

  /// function to fetch data to servers that was stored on the server
  getData() async {
    // return await FirebaseFirestore.instance.collection("blogs").get();
    return await FirebaseFirestore.instance.collection("blogs").snapshots();
  }
}
