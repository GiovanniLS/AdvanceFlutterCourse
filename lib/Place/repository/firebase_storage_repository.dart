import 'dart:io';

import 'package:advance_flutter_course/Place/repository/firebase_storeage_api.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {
  final _firebaseStorageAPI = FirebaseStorageAPI();

  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageAPI.uploadFile(path, image);
}
