import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'auth_methods.dart';
import 'upload_image_screen.dart';

class AddImage extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  AddImage({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  Uint8List? _image;
  AuthMethods _authMethods = AuthMethods();

  void selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path).readAsBytesSync();
      });
    }
  }

  void selectImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path).readAsBytesSync();
      });
    }
  }

  void uploadPost() {
    // Add your logic to upload the post
    // Navigate to the Home page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()), // Replace 'Home' with your actual home screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return AddPicture(
      email: widget.email,
      password: widget.password,
      username: widget.username,
    );
  }
}
