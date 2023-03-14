import 'package:flutter/material.dart';
// import 'package:test_app/animation/FadeAnimation.dart';
import 'package:live_streaming_app/animation/FadeAnimation.dart';

import 'package:live_streaming_app/resources/auth_methods.dart';
import 'package:live_streaming_app/responsive/responsive.dart';
import 'package:live_streaming_app/screens/content_screen.dart';
import 'package:live_streaming_app/screens/home_screen.dart';
import 'package:live_streaming_app/screens/login.dart';
import 'package:live_streaming_app/widgets/custom_button.dart';
import 'package:live_streaming_app/widgets/custom_textfield.dart';
import 'package:live_streaming_app/widgets/loading_indicator.dart';

class aiSignupPage extends StatefulWidget {
  static const String routeName = '/aisignup';
  @override
  State<aiSignupPage> createState() => _aiSignupPageState();
}

class _aiSignupPageState extends State<aiSignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    bool res = await _authMethods.signUpUser(
      context,
      _emailController.text,
      _usernameController.text,
      _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res) {
      Navigator.pushReplacementNamed(context, content_screen.routeName);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey.shade800,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.yellow,
          ),
        ),
      ),
      body: _isLoading
          ? const LoadingIndicator()
          : Responsive(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height - 50,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          FadeAnimation(
                              1,
                              Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                              1.2,
                              Text(
                                "Create an account, It's free",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.2,
                              makeInput(
                                  label: "Email",
                                  controller: _emailController)),
                          FadeAnimation(
                              1.3,
                              makeInput(
                                  label: "Username",
                                  obscureText: false,
                                  controller: _usernameController)),
                          FadeAnimation(
                              1.4,
                              makeInput(
                                  label: "Password",
                                  obscureText: true,
                                  controller: _passwordController)),
                        ],
                      ),
                      FadeAnimation(
                          1.5,
                          Container(
                            padding: EdgeInsets.only(top: 3, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: signUpUser,
                              color: Colors.yellow,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                          )),
                      FadeAnimation(
                          1.6,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Already have an account?",
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, aiLoginPage.routeName);
                                },
                                child: Text(
                                  " Login",
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget makeInput(
      {label, obscureText = false, TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.yellow),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          cursorColor: Colors.yellow,
          style: TextStyle(color: Colors.yellow),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
