import 'package:advance_flutter_course/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../model/user.dart';
import '../repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  Future<UserCredential> signIn() {
    return _auth_repository.signInFirebase();
  }

  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(UserLocal user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
