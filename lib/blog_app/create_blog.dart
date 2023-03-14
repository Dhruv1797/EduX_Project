import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import './services/crud.dart';
import 'package:random_string/random_string.dart';

class createblog extends StatefulWidget {
  @override
  State<createblog> createState() => _createblogState();
}

class _createblogState extends State<createblog> {
  String authorname, title, desc;
  File selectedImage;
  bool _isLoading = false;

  CrudMethods crudMethods = CrudMethods();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }

  uploadBlog() async {
    if (selectedImage != null) {
      setState(() {
        _isLoading = true;
      });

      /// upload image to firebase storage
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("blogImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      ///create a task to upload this data to our storage
      final UploadTask task = firebaseStorageRef.putFile(selectedImage);

      var downoadUrl = await (await task).ref.getDownloadURL();
      print("this is url $downoadUrl");

      Map<String, String> blogMap = {
        "imageUrl": downoadUrl,
        "authorName": authorname,
        "title": title,
        "desc": desc,
      };

      crudMethods.addData(blogMap).then((result) {
        Navigator.pop(context);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.yellow,
              size: 40,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Ref",
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "erence",
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            GestureDetector(
              onTap: (() {
                uploadBlog();
              }),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.file_upload,
                  color: Colors.yellow,
                ),
              ),
            )
          ],
        ),
        body: _isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              )
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: (() {
                          getImage();
                        }),
                        child: selectedImage != null
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 150,
                                width: deviceSize.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    selectedImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 150,
                                width: deviceSize.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.yellow,
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        width: deviceSize.width,
                        child: Column(
                          children: <Widget>[
                            TextField(
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                hintText: "Author Name",
                                hintStyle: TextStyle(color: Colors.yellow),
                              ),
                              onChanged: (val) {
                                authorname = val;
                              },
                            ),
                            TextField(
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                hintText: "title",
                                hintStyle: TextStyle(color: Colors.yellow),
                              ),
                              onChanged: (val) {
                                title = val;
                              },
                            ),
                            TextField(
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                hintText: "Description",
                                hintStyle: TextStyle(color: Colors.yellow),
                              ),
                              onChanged: (val) {
                                desc = val;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
