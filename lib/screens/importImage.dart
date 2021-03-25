import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gklabss/helpers/db-helper.dart';
import 'package:gklabss/screens/addPhoto.dart';

class ImagesDisplay extends StatefulWidget {
  static const routeName = 'imagesDisplay';

  @override
  _ImagesDisplayState createState() => _ImagesDisplayState();
}

class _ImagesDisplayState extends State<ImagesDisplay> {
  List<File> _items = [];

  Future<void> fetchAndSetProducts() async {
    final data = await DBhelper.getData('images_data');
    _items = data.map((item) => File(item['image'])).toList();
  }

  bool change = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: FutureBuilder(
        future: fetchAndSetProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          print(_items.length);
          return ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 200,
                child: Image.file(_items[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.of(context).pushNamed(AddPhoto.routeName).then((value) {
            if (value) {
              setState(() {});
            }
          });
        },
      ),
    );
  }
}
