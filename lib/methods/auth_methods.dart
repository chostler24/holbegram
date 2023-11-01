import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      return 'Please fill all the fields';
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
  }) async {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      return 'Please fill all the fields';
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Users user = Users(
        uid: userCredential.user!.uid,
        email: email,
        username: username,
        bio: '',
        photoUrl: '', // Set the default photoUrl
        followers: [],
        following: [],
        posts: [],
        saved: [],
        searchKey: username.substring(0, 1),
      );

      await _firestore.collection("users").doc(user.uid).set(user.toJson());
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }
}
