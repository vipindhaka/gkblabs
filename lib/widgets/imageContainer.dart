import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageContainer extends StatefulWidget {
  final void Function(File pickedImage) imagePick;
  ImageContainer(this.imagePick);
  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  File _pickedImageFile;
  bool _isLoading = false;
  void selectOption() {
    showDialog(
        //isScrollControlled: true,s
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * .80,
              height: 150,
              child: Column(
                children: [
                  Text(
                    'Select one option..',
                    style: TextStyle(fontSize: 25),
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Camera'),
                    onTap: () {
                      takePicture(1);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Gallery'),
                    onTap: () {
                      takePicture(2);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> takePicture(int value) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
        source: value == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 80);
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
    //_pickedImageFile.

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(pickedImage.path);
    final savedImage =
        await File(pickedImage.path).copy('${appDir.path}/$fileName');
    widget.imagePick(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * .25,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
            child: _pickedImageFile != null
                ? Image.file(
                    _pickedImageFile,
                    fit: BoxFit.cover,
                  )
                : Text(
                    'Image Preview',
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        _isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(onPressed: selectOption, child: Text('Add Image')),
      ],
    );
  }
}
