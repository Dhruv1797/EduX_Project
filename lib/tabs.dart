import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './blog_app/Tabs_screens/amazon.dart';
import './blog_app/Tabs_screens/github.dart';
import './blog_app/Tabs_screens/google.dart';
import './blog_app/Tabs_screens/youtube.dart';

class Tabscreen extends StatefulWidget {
  @override
  State<Tabscreen> createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      bottomNavigationBar: Container(
        child: TabBar(
          controller: tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.yellow,
          labelStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
          tabs: <Tab>[
            Tab(
              icon: Icon(FontAwesomeIcons.google),
              text: "Google",
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.amazon),
              text: "Amazon",
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.youtube),
              text: "Youtube",
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.github),
              text: "Github",
            ),
          ],
        ),
      ),
      body: Container(
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: <Widget>[
            googleScreen(),
            amazonScreen(),
            youtubeScreen(),
            githubScreen(),
          ],
        ),
      ),
    );
  }
}
