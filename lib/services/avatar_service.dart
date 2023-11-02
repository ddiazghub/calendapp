import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AvatarService extends GetxService {
  final storage = FirebaseStorage.instance.ref().child('avatars');

  Future<String> create(XFile avatar) async {
    print(storage);
    final ref = storage.child(avatar.name);
    print(ref);

    await ref.putData(
      await avatar.readAsBytes(),
      SettableMetadata(contentType: avatar.mimeType),
    );

    print('put done');
    final url = await ref.getDownloadURL();
    print(url);

    return url;
  }
}
