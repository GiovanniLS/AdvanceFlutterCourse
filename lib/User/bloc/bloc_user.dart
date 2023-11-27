import 'dart:io';

import 'package:advance_flutter_course/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../Place/model/place.dart';
import '../../Place/repository/firebase_storage_repository.dart';
import '../model/user.dart';
import '../repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  Future<User?> currentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

  // Use cases
  // 1. SignIn Google
  Future<UserCredential> signIn() => _auth_repository.signInFirebase();

  // 2. Register user data base
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(UserLocal user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceDate(place);

  final _firebaseStorageRepository = FirebaseStorageRepository();

  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
