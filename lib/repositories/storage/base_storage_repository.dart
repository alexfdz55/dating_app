import 'package:dating_app/models/models.dart';
import 'package:image_picker/image_picker.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(User user, XFile image);

  Future<void> getDownloadUrl(User user, String imageName);
}
