import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> getPermissions() async {
  final bool getStorage = await Permission.storage.isUndetermined;
  final bool getPhotos = await Permission.photos.isUndetermined;
  if (getStorage || getPhotos) {
    await [Permission.storage, Permission.photos].request();
  }
}

FirebaseAuth getFireAuthInstance() => FirebaseAuth.instance;
