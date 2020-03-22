import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _imageFile;

  void _imageInputModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      'Camera',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0),
                    ),
                  ),
                  onTap: () {
                    // add camera image functionality here
                    _getImage(
                      context,
                      ImageSource.camera,
                    );
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0),
                    ),
                  ),
                  onTap: () {
                    // add gallery image functionality here
                    _getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // add if else statement for image preview
    if (_imageFile == null) {
      return Container(
        padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
        decoration: BoxDecoration(
            color: Color(0xBF98DD97),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              borderSide: BorderSide(style: BorderStyle.none),
              onPressed: () {
                // icon of camera is the button
                _imageInputModal(context);
              },
              child: Icon(
                Icons.camera_alt,
                size: 100.0,
                color: Colors.white,
              ),
            ),
            Text(
              'Add Image',
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            )
          ],
        ),
      );
    }

    // else for image preview
    else {
      return Container(
        padding: EdgeInsets.all(10.0),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: Color(0xBF98DD97),
            borderRadius: BorderRadius.circular(15.0)),
        child: Image.file(
          _imageFile,
          fit: BoxFit.scaleDown,
          height: 150.0,
        ),
      );
    }
  }

  // function for camera image picker
  void _getImage(context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0)
        .then((File imageFile) {
      setState(() {
        _imageFile = imageFile;
      });
      Navigator.pop(context);
    });
  }
}
