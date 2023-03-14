import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class About_screen extends StatelessWidget {
  const About_screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "About",
              style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "-us",
              style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2, left: 20, right: 20, bottom: 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              // bottomRight: Radius.circular(40.0),
              topLeft: Radius.circular(10.0),
              // bottomLeft: Radius.circular(40.0)
            ),
            color: Colors.grey.shade700,
          ),
          height: deviceSize.height * 0.9,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            'Introduction ',
                            style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     blurRadius: 15.0,
                                //     color: Colors.black,
                                //     offset: Offset(5.0, 5.0),
                                //   ),
                                // ],
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '  An Online Learning Platform  We Make Education To Reach World Wide Through Different Mediums Via Streaming And Providing A Platform Earn via Merchandise , Teaching And Students Learn  From The Top World Class Teaching Professionals ',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            'Vision',
                            style: TextStyle(
                              // shadows: [
                              //   Shadow(
                              //     blurRadius: 15.0,
                              //     color: Colors.black,
                              //     offset: Offset(5.0, 5.0),
                              //   ),
                              // ],
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          ' Quality Education  By World Class Teaching Professional , Better Interaction  Via Connect Through Group Chatting , Earning Platform , Through Teaching And Merchandise products',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            'What we do!',
                            style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     blurRadius: 15.0,
                                //     color: Colors.black,
                                //     offset: Offset(5.0, 5.0),
                                //   ),
                                // ],
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'LEARNING PLATFORM  Here students can learn their interested topics from the World’s Top Teaching Professionals , MERCHANDISE SHOP Here companies and the merchants can sponsor their products and services globally STUDY REFRENCE Here students as well as the teaching faculty can upload the study related content to refer for study LIVE STREAMING Here one will be able to do the live streaming and will be able to connect globally to share their skills and content TEACHING PLATFORM Here the teaching professionals can list the exclusive paid courses and can generate revenue from that course GROUP CHATTING Here the user(Teaching professionals as well as student) will be able to create and join chatting groups for better interaction and doubt solving',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(6.0),
                        //   child: Text(
                        //     'Who support us',
                        //     style: TextStyle(
                        //         // shadows: [
                        //         //   Shadow(
                        //         //     blurRadius: 15.0,
                        //         //     color: Colors.black,
                        //         //     offset: Offset(5.0, 5.0),
                        //         //   ),
                        //         // ],
                        //         color: Colors.white,
                        //         fontSize: 25,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        // Text(
                        //   'kiet ',
                        //   style: TextStyle(
                        //       color: Colors.yellow,
                        //       fontStyle: FontStyle.italic),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            'Why Associate with us',
                            style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     blurRadius: 15.0,
                                //     color: Colors.black,
                                //     offset: Offset(5.0, 5.0),
                                //   ),
                                // ],
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'This is just a prototype of the ‘EduX’ Project We will add some more additional features to the application and make it more handy to use by adding different themes to the project and building custom layouts and more features will comming soon stay tunned !',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            '            Developers',
                            style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     blurRadius: 15.0,
                                //     color: Colors.black,
                                //     offset: Offset(5.0, 5.0),
                                //   ),
                                // ],
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '*    Dhruv Rastogi   \n*    Adarsh Kumar Dubey \n*    Anushka Gupta',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            'Contact us',
                            style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     blurRadius: 15.0,
                                //     color: Colors.black,
                                //     offset: Offset(5.0, 5.0),
                                //   ),
                                // ],
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '  GOOGLE    LINKDIN    FACEBOOK  TWITTER',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 25),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(6.0),
                  //             child: Text(
                  //               'Contact Us',
                  //               style: TextStyle(
                  //                   shadows: [
                  //                     Shadow(
                  //                       blurRadius: 15.0,
                  //                       color: Colors.black,
                  //                       offset: Offset(5.0, 5.0),
                  //                     ),
                  //                   ],
                  //                   color: Colors.white,
                  //                   fontSize: 25,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //           ),
                  //           Text(
                  //             'GOOGLE \nLINKDIN \nFACEBOOK \nTWITTER',
                  //             style: TextStyle(
                  //                 color: Colors.yellow,
                  //                 fontStyle: FontStyle.italic),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 25),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.all(6.0),
                  //         child: Text(
                  //           'Contact Us',
                  //           style: TextStyle(
                  //               shadows: [
                  //                 Shadow(
                  //                   blurRadius: 15.0,
                  //                   color: Colors.black,
                  //                   offset: Offset(5.0, 5.0),
                  //                 ),
                  //               ],
                  //               color: Colors.white,
                  //               fontSize: 25,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       Text(
                  //         'GOOGLE \nLINKDIN \nFACEBOOK \nTWITTER',
                  //         style: TextStyle(
                  //             fontStyle: FontStyle.italic,
                  //             //   shadows: [
                  //             //   Shadow(
                  //             //     blurRadius: 15.0,
                  //             //     color: Colors.black,
                  //             //     offset: Offset(5.0, 5.0),
                  //             //   ),
                  //             // ],
                  //             color: Colors.yellow),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
