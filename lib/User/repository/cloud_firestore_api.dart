import 'package:advance_flutter_course/User/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Place/model/Place.dart';
import '../ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(UserLocal user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      "uid": user.uid,
      "name": user.name,
      "email ": user.email,
      "photoURL": user.photoURL,
      "myPlaces": user.myPlaces,
      "myFavoritePlaces": user.myFavoritePlaces,
      "lastSignIn": DateTime.now(),
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    User? user = _auth.currentUser;
    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': _db.doc("$USERS/${user?.uid}")
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        DocumentReference refUsers = _db.collection(USERS).doc(user?.uid ?? "");
        refUsers.update({
          "myPlaces": FieldValue.arrayUnion([_db.doc("$PLACES/${snapshot.id}")])
        });
      });
    });
  }

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = [];
    for (var p in placesListSnapshot) {
      profilePlaces.add(ProfilePlace(Place(
          name: p.get("name"),
          description: p.get("description"),
          urlImage: p.get("urlImage"))));
    }
    return profilePlaces;
  }
}
