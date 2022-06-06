import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/user_model.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';

import 'base_database_repository.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }

  @override
  Future<void> updateUser(User user) async {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then((value) => print('User document updated.'));
  }

  @override
  Future<void> updateUserPictures(User user, String imageName) async {
    String dowloadUrl = await StorageRepository().getDownloadUrl(
      user,
      imageName,
    );
    return _firebaseFirestore.collection('users').doc(user.id).update({
      "imageUrls": FieldValue.arrayUnion([dowloadUrl])
    });
  }

  @override
  Stream<List<User>> getUsers(String userId, String gender) {
    return _firebaseFirestore
        .collection('users')
        .where('gender', isNotEqualTo: gender)
        .snapshots()
        .map((snap) => snap.docs.map((doc) => User.fromSnapshot(doc)).toList());
  }
}
