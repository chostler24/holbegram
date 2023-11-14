import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'auth_methods.dart';
import 'upload_image_screen.dart';

class AddImage extends StatefulWidget { // Much like the AddPicture class, this class is a StatefulWidget
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
    void uploadPost() async {
      if (_image != null) {
        // Show a loading indicator while the post is being uploaded
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Upload the post
        String imageUrl = await _authMethods.uploadImage(_image!);

        // Hide the loading indicator
        Navigator.pop(context);

        // Navigate to the Home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        // Show an error message if no image is selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select an image to upload.'),
          ),
        );
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
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
