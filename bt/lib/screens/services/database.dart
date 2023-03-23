import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference btCollection =
      FirebaseFirestore.instance.collection('profiles');

  Future updateUserData(String name, String gender, int age) async {
    return await btCollection.doc(uid).set({
      'name': name,
      'gender': gender,
      'age': age,
    });
  }
}
