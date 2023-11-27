import 'package:advance_flutter_course/User/repository/cloud_firestore_api.dart';

import '../../Place/model/place.dart';
import '../model/user.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(UserLocal user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDate(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);
}
