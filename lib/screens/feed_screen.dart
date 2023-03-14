import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_streaming_app/models/livestream.dart';
import 'package:live_streaming_app/resources/firestore_methods.dart';
import 'package:live_streaming_app/responsive/resonsive_layout.dart';
import 'package:live_streaming_app/screens/broadcast_screen.dart';
import 'package:live_streaming_app/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
          top: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: const Text(
                  'Live-Streaming',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              StreamBuilder<dynamic>(
                stream: FirebaseFirestore.instance
                    .collection('livestream')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingIndicator();
                  }

                  return Container(
                    height: deviceSize.height * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade700,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ResponsiveLatout(
                            desktopBody: GridView.builder(
                              itemCount: snapshot.data.docs.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemBuilder: (context, index) {
                                LiveStream post = LiveStream.fromMap(
                                    snapshot.data.docs[index].data());
                                return Container(
                                  width: deviceSize.width,
                                  height: deviceSize.height,
                                  child: InkWell(
                                    onTap: () async {
                                      await FirestoreMethods().updateViewCount(
                                          post.channelId, true);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => BroadcastScreen(
                                            isBroadcaster: false,
                                            channelId: post.channelId,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.35,
                                            child: Image.network(
                                              post.image,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                post.username,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.yellow),
                                              ),
                                              Text(
                                                post.title,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${post.viewers} watching',
                                                style: const TextStyle(
                                                    color: Colors.yellow),
                                              ),
                                              Text(
                                                'Started ${timeago.format(post.startedAt.toDate())}',
                                                style: TextStyle(
                                                  fontFamily: 'RobotoCondensed',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            mobileBody: ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  LiveStream post = LiveStream.fromMap(
                                      snapshot.data.docs[index].data());

                                  return InkWell(
                                    onTap: () async {
                                      await FirestoreMethods().updateViewCount(
                                          post.channelId, true);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => BroadcastScreen(
                                            isBroadcaster: false,
                                            channelId: post.channelId,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      // color: Colors.red,
                                      height: size.height * 0.1,
                                      width: size.width,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: 16 / 9,
                                                  child:
                                                      Image.network(post.image),
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            post.username,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .yellow),
                                                          ),
                                                          Text(
                                                            post.title,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          Text(
                                                            '${post.viewers} watching',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue
                                                                    .shade200),
                                                          ),
                                                          Flexible(
                                                            child:
                                                                new Container(
                                                              width: 140,
                                                              // color:
                                                              //     Colors.yellow,
                                                              padding:
                                                                  new EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          13.0),
                                                              child: new Text(
                                                                'Started ${timeago.format(post.startedAt.toDate())}',
                                                                overflow:
                                                                    TextOverflow
                                                                        .fade,
                                                                maxLines: 1,
                                                                softWrap: false,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ),
                                                          ),
                                                          // FittedBox(
                                                          //   child: Text(
                                                          //     'Started ${timeago.format(post.startedAt.toDate())}',
                                                          //     style: TextStyle(
                                                          //         color: Colors
                                                          //             .grey),
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.more_vert,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
