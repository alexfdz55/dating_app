import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/user_model.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';

import 'base_database_repository.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return _firebaseFirestore
        .collection('users')
        .doc('2yV9uHqFcp82AdO1KVBo')
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String dowloadUrl = await StorageRepository().getDownloadUrl(imageName);
    return _firebaseFirestore
        .collection('users')
        .doc('2yV9uHqFcp82AdO1KVBo')
        .update({
      "imageUrls": FieldValue.arrayUnion([dowloadUrl])
    });
  }
}
