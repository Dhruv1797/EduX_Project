import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './create_blog.dart';
import './services/crud.dart';
import 'package:cached_network_image/cached_network_image.dart';

class bloghome extends StatefulWidget {
  const bloghome({Key key}) : super(key: key);

  @override
  State<bloghome> createState() => _bloghomeState();
}

class _bloghomeState extends State<bloghome> {
  CrudMethods crudMethods = CrudMethods();

  // QuerySnapshot? blogsSnapshot;
  Stream blogsStream;

  Widget BlogsList() {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      // child: blogsSnapshot != null
      child: blogsStream != null
          ? Container(
              height: deviceSize.height,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // StreamBuilder(stream: blogsStream,builder: (context ,  snapshot){
                    StreamBuilder<dynamic>(
                      stream: blogsStream,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null)
                          return Container(
                              height: deviceSize.height,
                              width: deviceSize.width,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.yellow,
                              )));
                        return SingleChildScrollView(
                          child: Container(
                            height: deviceSize.height * 0.795,
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: deviceSize.width * 0.03),
                              // itemCount: blogsSnapshot!.docs.length,
                              itemCount: snapshot.data.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return BlogsTile(
                                  authorName: snapshot.data.docs[index]
                                      .get('authorName'),
                                  title: snapshot.data.docs[index].get('title'),
                                  description:
                                      snapshot.data.docs[index].get('desc'),
                                  imageUrl:
                                      snapshot.data.docs[index].get('imageUrl'),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    // SingleChildScrollView(
                    //   child: ListView.builder(
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal: deviceSize.width * 0.03),
                    //       itemCount: blogsSnapshot!.docs.length,
                    //       shrinkWrap: true,
                    //       itemBuilder: (context, index) {
                    //         return BlogsTile(
                    //           authorName:
                    //               blogsSnapshot!.docs[index].get('authorName'),
                    //           title: blogsSnapshot!.docs[index].get('title'),
                    //           description: blogsSnapshot!.docs[index].get('desc'),
                    //           imageUrl: blogsSnapshot!.docs[index].get('imageUrl'),
                    //         );
                    //       }),
                    // ),
                  ],
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    crudMethods.getData().then(
      (result) {
        // blogsSnapshot = result;
        setState(() {
          blogsStream = result;
        });
        // blogsStream = result;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
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
        ),
        body: BlogsList(),
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(
            vertical: deviceSize.height * 0.02,
          ),
          width: deviceSize.width,
          // color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.grey.shade900,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => createblog()));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.yellow,
                  )),
              SizedBox(
                width: deviceSize.width * 0.37,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BlogsTile extends StatelessWidget {
  String imageUrl, title, description, authorName;

  BlogsTile({
    this.imageUrl,
    this.title,
    this.description,
    this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      // height: deviceSize.height * 0.4,
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 200,
            width: deviceSize.width,
            child: Image.network(
              imageUrl,
              width: deviceSize.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Container(
        //   height: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.black.withOpacity(0.3),
        //     borderRadius: BorderRadius.circular(6),
        //   ),
        // ),
        Container(
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                authorName,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
