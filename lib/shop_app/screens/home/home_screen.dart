import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:live_streaming_app/shop_app/constants.dart';

import 'package:live_streaming_app/shop_app/screens/home/components/body.dart';

class ShopHomeScreen extends StatelessWidget {
  static String routeName = '/ShopHomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey.shade900,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.yellow,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: Colors.yellow,
            // By default our  icon color is white
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: Colors.yellow,
            // By default our  icon color is white
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
