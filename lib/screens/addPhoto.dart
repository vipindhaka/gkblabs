import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gklabss/helpers/db-helper.dart';
import 'package:gklabss/widgets/imageContainer.dart';

class AddPhoto extends StatefulWidget {
  static const routeName = 'add Blog';

  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  // final _titleController = TextEditingController();
  // final _descriptionController = TextEditingController();
  //bool _isLoading = false;
  File _imageSelected;
  void pickImage(File pickedImage) {
    _imageSelected = pickedImage;
  }

  Future<void> addPlace(
      //File image,
      ) async {
    await DBhelper.insert('images_data', {
      'image': _imageSelected.path,
    });

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    //print(_imageSelected);
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Image'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageContainer(pickImage),
                Text(
                  'Share Your Experience',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.grey)),
                ),
                ElevatedButton.icon(
                    onPressed: addPlace,
                    icon: Icon(Icons.check),
                    label: Text('Save Image'))
              ],
            ),
          ),
        ));
  }
}
