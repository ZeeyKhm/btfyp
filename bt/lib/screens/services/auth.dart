import 'package:bt/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
   MyUser? _userFromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges()
    .map((User? user) =>_userFromFirebase(user!)!);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return  _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email & password

  //register email & password

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
