import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bt/models/profile.dart';

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

  //profile list from snapshot
  List<Profile> _profileListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Profile(
          name: doc.get('name') ?? '',
          gender: doc.get('gender') ?? '',
          age: doc.get('age') ?? 0);
    }).toList();
  }

  //get profiles stream
  Stream<List<Profile>> get profiles {
    return btCollection.snapshots().map(_profileListFromSnapShot);
  }
}
