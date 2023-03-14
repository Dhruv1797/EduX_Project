import 'package:flutter/material.dart';
import 'package:live_streaming_app/blog_app/blog_home.dart';
import 'package:live_streaming_app/screens/broadcast_screen.dart';
import 'package:live_streaming_app/screens/content_screen.dart';
import 'package:live_streaming_app/tabs.dart';
import 'package:provider/provider.dart';
import 'package:live_streaming_app/providers/user_provider.dart';
import 'package:live_streaming_app/screens/feed_screen.dart';
import 'package:live_streaming_app/screens/go_live_screen.dart';
import 'package:live_streaming_app/utils/colors.dart';
import 'package:live_streaming_app/shop_app/screens/home/home_screen.dart';
import 'package:live_streaming_app/chat_app/pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  List<Widget> pages = [
    const FeedScreen(),
    const GoLiveScreen(),
    const Center(
      child: Text('Browser'),
    ),
  ];

  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvder = Provider.of<UserProvider>(context, listen: false);
    final content = ListTile(
      leading: Icon(
        Icons.home,
        size: 26,
      ),
      title: Text(
        " content",
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => content_screen()));
      },
    );
    final Tabs = ListTile(
      leading: Icon(
        Icons.home,
        size: 26,
      ),
      title: Text(
        " Tabs",
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Tabscreen()));
      },
    );
    final Blog = ListTile(
      leading: Icon(
        Icons.home,
        size: 26,
      ),
      title: Text(
        " Blog",
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => bloghome()));
      },
    );
    final shop = ListTile(
      leading: Icon(
        Icons.home,
        size: 26,
      ),
      title: Text(
        " Shop",
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ShopHomeScreen()));
      },
    );
    final chat = ListTile(
      leading: Icon(
        Icons.home,
        size: 26,
      ),
      title: Text(
        " Chat",
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChatHomePage()));
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
          content,
          Blog,
          Tabs,
          shop,
          chat,
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      // drawer: drawer,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: buttonColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.grey.shade900,
        unselectedFontSize: 12,
        onTap: onPageChange,
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade900,
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Following',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_rounded,
            ),
            label: 'Go Live',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.copy,
          //   ),
          //   label: 'Browse',
          // ),
        ],
      ),
      body: pages[_page],
    );
  }
}
