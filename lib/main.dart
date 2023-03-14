// @dart=2.9
import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:live_streaming_app/blog_app/blog_home.dart';
import 'package:live_streaming_app/screens/aionboarding.dart';
import 'package:live_streaming_app/screens/content_screen.dart';
import 'package:live_streaming_app/screens/login.dart';
import 'package:live_streaming_app/screens/signup.dart';
import 'package:provider/provider.dart';
import 'package:live_streaming_app/providers/user_provider.dart';
import 'package:live_streaming_app/resources/auth_methods.dart';
import 'package:live_streaming_app/screens/home_screen.dart';
import 'package:live_streaming_app/screens/login_screen.dart';
import 'package:live_streaming_app/screens/onboarding_screen.dart';
import 'package:live_streaming_app/screens/signup_screen.dart';
import 'package:live_streaming_app/utils/colors.dart';
import 'package:live_streaming_app/widgets/loading_indicator.dart';
import 'models/user.dart' as model;
import 'package:live_streaming_app/shop_app/screens/home/home_screen.dart';

import 'package:live_streaming_app/screens/http_overwrite.dart';

import 'package:provider/provider.dart';
import './shop_app1/screens/splash_screen.dart';

import './shop_app1/screens/cart_screen.dart';
import './shop_app1/screens/products_overview_screen.dart';
import './shop_app1/screens/product_detail_screen.dart';
import './shop_app1/providers/products.dart';
import './shop_app1/providers/cart.dart';
import './shop_app1/providers/orders.dart';
import './shop_app1/providers/auth.dart';
import './shop_app1/screens/orders_screen.dart';
import './shop_app1/screens/user_products_screen.dart';
import './shop_app1/screens/edit_product_screen.dart';
import './shop_app1/screens/auth_screen.dart';
import './shop_app1/helpers/custom_route.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDY7P2KH9prqa-oWW2B2oyFrmjWpodAvzE",
          authDomain: "live-streaming-app-ad026.firebaseapp.com",
          projectId: "live-streaming-app-ad026",
          storageBucket: "live-streaming-app-ad026.appspot.com",
          messagingSenderId: "646350063152",
          appId: "1:646350063152:web:637768714d767d71410ff5"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvder = Provider.of<UserProvider>(context, listen: false);
    final userid = userProvder.user.uid;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            userid,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Twitch Clone Tutorial',
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: AppBarTheme.of(context).copyWith(
              backgroundColor: backgroundColor,
              elevation: 0,
              titleTextStyle: const TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              iconTheme: const IconThemeData(
                color: primaryColor,
              ),
            ),
          ),

          routes: {
            OnboardingScreen.routeName: (context) => const OnboardingScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            SignupScreen.routeName: (context) => const SignupScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            content_screen.routeName: (context) => const content_screen(),
            ShopHomeScreen.routeName: (context) => ShopHomeScreen(),
            //
            aiLoginPage.routeName: (context) => aiLoginPage(),
            aiSignupPage.routeName: (context) => aiSignupPage(),

            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routename: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
          // home: LoginScreen(),
          home: AnimatedSplashScreen(
            splash: Image.asset('assets/Edux1.png'),
            splashIconSize: 200,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.grey.shade800,
            duration: 500,
            nextScreen: FutureBuilder(
              future: AuthMethods()
                  .getCurrentUser(FirebaseAuth.instance.currentUser != null
                      ? FirebaseAuth.instance.currentUser.uid
                      : null)
                  .then((value) {
                if (value != null) {
                  Provider.of<UserProvider>(context, listen: false).setUser(
                    model.User.fromMap(value),
                  );
                }
                return value;
              }),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator();
                }

                if (snapshot.hasData) {
                  return const content_screen();
                }
                return const aiOnboarding();
              },
            ),
          ),
        ),
      ),
    );
  }
}
