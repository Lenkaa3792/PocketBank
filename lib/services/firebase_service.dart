import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final String USER_COLLECTION = 'users';

class FirebaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Map? currentUser;

  FirebaseService();

  Future<bool> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      String userId = userCredential.user!.uid;

      // Save user data in Firestore
      await _db.collection(USER_COLLECTION).doc(userId).set({
        'uid': userId,
        'email': email,
      });

      return true;
    } catch (e) {
      print("Error registering user: $e");
      return false;
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        currentUser = await getUserData(uid: userCredential.user!.uid);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error logging in: $e");
      return false;
    }
  }

  Future<Map?> getUserData({required String uid}) async {
    try {
      // Get user data from Firestore
      DocumentSnapshot userDoc = await _db.collection(USER_COLLECTION).doc(uid).get();
      return userDoc.data() as Map?;
    } catch (e) {
      print("Error getting user data: $e");
      return null;
    }
  }
}
