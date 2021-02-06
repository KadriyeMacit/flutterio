import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadMedia(File file) async {
    var uploadTask = _firebaseStorage
        .ref()
        .child(
        "${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}")
        .putFile(file);

    uploadTask.events.listen((event) {});

    var storageRef = await uploadTask.onComplete;

    return await storageRef.ref.getDownloadURL();
  }
}
