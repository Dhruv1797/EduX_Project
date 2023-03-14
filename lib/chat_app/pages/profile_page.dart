// import 'package:chat2_app/pages/auth/login_page.dart';
// import 'package:chat2_app/pages/home_page.dart';
// import 'package:chat2_app/service/auth_service.dart';
// import 'package:chat2_app/widgets/widgets.dart';

import 'package:live_streaming_app/chat_app/pages/auth/login_page.dart';
import 'package:live_streaming_app/chat_app/pages/home_page.dart';
import 'package:live_streaming_app/chat_app/service/auth_service.dart';
import 'package:live_streaming_app/chat_app/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:live_streaming_app/screens/content_screen.dart';

import 'package:live_streaming_app/screens/login_screen.dart';
import 'package:live_streaming_app/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:live_streaming_app/providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;
  ProfilePage({Key key, @required this.email, @required this.userName})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final userProvder = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        title: const Text(
          "user",
          style: TextStyle(
              color: Colors.yellow, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.grey.shade800,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50),
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.yellow,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                userProvder.user.username,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.yellow),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                height: 2,
              ),
              // ListTile(
              //   onTap: () {
              //     nextScreen(context, const content_screen());
              //   },
              //   contentPadding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   leading: const Icon(Icons.connect_without_contact_sharp,
              //       color: Colors.yellow),
              //   title: const Text(
              //     "Groups",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              ListTile(
                onTap: () {},
                selected: true,
                selectedColor: Theme.of(context).primaryColor,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.person,
                  color: Colors.yellow,
                ),
                title: const Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () async {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.grey.shade700,
                          title: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.black),
                          ),
                          content: const Text(
                            "Are you sure you want to logout?",
                            style: TextStyle(color: Colors.yellow),
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await authService.signOut();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OnboardingScreen()),
                                    (route) => false);
                              },
                              icon: const Icon(
                                Icons.done,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        );
                      });
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.yellow,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.yellow,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("username",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
                Text(userProvder.user.username,
                    style: const TextStyle(fontSize: 17, color: Colors.yellow)),
              ],
            ),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
                Text(userProvder.user.email,
                    style: const TextStyle(fontSize: 17, color: Colors.yellow)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
