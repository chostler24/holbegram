import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'auth_methods.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  AddPicture({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
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

  void _handleSignUp() async {
    String result = await _authMethods.signUpUser(
      email: widget.email,
      password: widget.password,
      username: widget.username,
      file: _image,
    );

    if (result == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Success'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_image != null)
          CircleAvatar(
            radius: 60,
            backgroundImage: MemoryImage(_image!),
          ),
        SizedBox(height: 20),
        InkWell(
          onTap: selectImageFromGallery,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Select Image from Gallery',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: selectImageFromCamera,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Take Picture with Camera',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        FlatButton(
          onPressed: _image == null ? null : _handleSignUp,
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          color: Colors.blue,
          disabledColor: Colors.grey,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    )
    return Container();
  }
}
