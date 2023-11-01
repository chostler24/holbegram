import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth/methods/user_storage.dart';

class PostStorage {
    FirebaseFirestore _firestore;
    UserStorage _userStorage;

    PostStorage() {
        _firestore = FirebaseFirestore.instance;
        _userStorage = UserStorage();
    }

    Future<String> uploadPost(String caption, String uid, String username, String profImage, Uint8List image) async {
        try {
            String imageUrl = await _userStorage.uploadImageToStorage(image);
            await _firestore.collection('posts').add({
                'caption': caption,
                'uid': uid,
                'username': username,
                'profImage': profImage,
                'imageUrl': imageUrl,
                'timestamp': FieldValue.serverTimestamp(),
            });
            return 'Ok';
        } catch (e) {
            return e.toString();
        }
    }

    Future<void> deletePost(String postId) async {
        try {
            await _firestore.collection('posts').doc(postId).delete();
        } catch (e) {
            print(e.toString());
        }
    }
}
