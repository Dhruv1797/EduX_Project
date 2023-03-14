import 'package:flutter/material.dart';
import 'package:live_streaming_app/blog_app/blog_home.dart';
import 'package:live_streaming_app/chat_app/pages/home_page.dart';
import 'package:live_streaming_app/screens/animation/about_screen.dart';
import 'package:live_streaming_app/screens/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_streaming_app/screens/home_screen.dart';
import 'package:live_streaming_app/shop_app/screens/home/home_screen.dart';
import 'package:live_streaming_app/shop_app1/screens/products_overview_screen.dart';
import 'package:live_streaming_app/tabs.dart';

import '../shop_app1/screens/splash_screen.dart';

class content_screen extends StatefulWidget {
  static String routeName = '/content';

  const content_screen({Key key}) : super(key: key);

  @override
  State<content_screen> createState() => _content_screenState();
}

class _content_screenState extends State<content_screen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 6, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final home_screen = ListTile(
      leading: Icon(
        Icons.home,
        size: 26,
      ),
      title: Text(
        "home_screen",
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );
    final drawer = Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "MENU",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          home_screen,
        ],
      ),
    );
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        // drawer: drawer,
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black38,
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(20.0),
              // topRight: Radius.circular(20.0),
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),
          child: TabBar(
            controller: tabController,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.yellow,
            labelStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            tabs: <Tab>[
              // Tab(
              //   icon: Icon(FontAwesomeIcons.shopify),
              //   text: "Shop1",
              // ),
              Tab(
                icon: Icon(FontAwesomeIcons.shopify),
                text: "Shop",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.blog),
                text: "Reference",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.stream),
                text: "Live-Stream",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.connectdevelop),
                text: "Connect",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.firefoxBrowser),
                text: "Browser",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.at),
                text: "About us",
              ),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: <Widget>[
              // ProductsOverviewScreen(),
              ShopHomeScreen(),
              bloghome(),
              HomeScreen(),
              ChatHomePage(),
              Tabscreen(),
              About_screen(),
            ],
          ),
        ),
      ),
    );
  }
}
