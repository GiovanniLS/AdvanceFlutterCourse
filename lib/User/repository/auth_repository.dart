import 'package:firebase_auth/firebase_auth.dart';
import 'package:advance_flutter_course/User/repository/firebase_auth_api.dart';

class AuthRepository{

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<User> signInFirebase() => _firebaseAuthAPI.signIn();
}